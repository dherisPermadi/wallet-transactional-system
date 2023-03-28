module Api
  module V1
    class WalletsController < ApplicationController
      before_action :must_be_authorized
      before_action :set_wallet, only: :detail

      def detail
        @wallet ? json_response(WalletSerializer.new(@wallet)) : validate_response('Data not found!')
      end

      private

      def set_wallet
        @wallet = Wallet.find_by(walletable_id: current_client.id, walletable_type: client_type.camelize)
      end
    end
  end
end
