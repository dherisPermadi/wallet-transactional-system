module Api
  module V1
    class StocksController < ApplicationController
      before_action :must_be_authorized
      before_action :set_stock, only: :show

      def index
        stocks = Stock.includes(:identifier_stock, :stockable, :wallet)
                      .where(stockable_id: current_client, stockable_type: client_type.camelize)
                      .order(created_at: :desc)
                      .page(params[:page] || 1)
                      .per(params[:per_page] || 15)
        serializer = generate_collection_serializer(stocks, Lists::StockSerializer)
        json_response_page(serializer, stocks)
      end

      def show
        @stock ? json_response(StockSerializer.new(@stock)) : validate_response('Data not found!')
      end

      private

      def set_stock
        @stock = Stock.find(params[:id])
      end
    end
  end
end
