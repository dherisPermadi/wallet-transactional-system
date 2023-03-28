module Api
  module V1
    class IndicesStocksController < ApplicationController
      before_action :must_be_authorized

      def index
        indices = IndicesStock.order(name: :asc)
                              .page(params[:page] || 1)
                              .per(params[:per_page] || 15)
        serializer = generate_collection_serializer(indices, Lists::IndicesStockSerializer)
        json_response_page(serializer, indices)
      end
    end
  end
end
