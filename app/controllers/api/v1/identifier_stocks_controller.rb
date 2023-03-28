module Api
  module V1
    class IdentifierStocksController < ApplicationController
      before_action :must_be_authorized
      before_action :set_identifier_stock, only: :show

      def index
        identifiers = IdentifierStock.includes(:indices_stock)
                                     .order(symbol_name: :asc)
                                     .page(params[:page] || 1)
                                     .per(params[:per_page] || 15)
        serializer = generate_collection_serializer(identifiers, Lists::IdentifierStockSerializer)
        json_response_page(serializer, identifiers)
      end

      def show
        @identifier_stock ? json_response(IdentifierStockSerializer.new(@identifier_stock)) :
                            validate_response('Data not found!')
      end

      private

      def set_identifier_stock
        @identifier_stock = IdentifierStock.find(params[:id])
      end
    end
  end
end
