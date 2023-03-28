module Api
  module V1
    class TransactionsController < ApplicationController
      before_action :must_be_authorized
      before_action :set_transaction, only: :show

      def index
        transactions = Transaction.where(sourceable_id: current_client, sourceable_type: client_type.camelize)
                                  .order(created_at: :desc)
                                  .page(params[:page] || 1)
                                  .per(params[:per_page] || 15)
        serializer = generate_collection_serializer(transactions, Lists::TransactionSerializer)
        json_response_page(serializer, transactions)
      end

      def create
        transaction = params_initialization
        if transaction.save
          json_response(TransactionSerializer.new(transaction))
        else
          validate_response(transaction.errors.full_messages.to_sentence)
        end
      end

      def show
        @transaction ? json_response(TransactionSerializer.new(@transaction)) : validate_response('Data not found!')
      end

      private

      def set_transaction
        @transaction = Transaction.find(params[:id])
      end

      def transaction_params
        params.require(:transaction).permit(:sourceable_type, :sourceable_id, :targetable_type,
                                            :targetable_id, :transaction_type, :amount, :identifier_stock_id,
                                            :stock_quantity, :stock_price)
      end

      def params_initialization
        transaction = Transaction.new(transaction_params)
        if ['deposit','withdrawal'].include?(transaction.transaction_type) ||
          (transaction.transaction_type.eql?('transfer') && transaction.sourceable_id.blank?)
          transaction.sourceable_id   = current_client.id
          transaction.sourceable_type = client_type.camelize
        else
          transaction.targetable_id   = current_client.id
          transaction.targetable_type = client_type.camelize
        end

        transaction
      end
    end
  end
end
