module Lists
  # serializer class for list of stock
  class StockSerializer < ActiveModel::Serializer
    attributes :id, :identifier_stock, :stockable_type, :stockable_id,
    :stockable_name, :wallet_balance, :quantity, :unit_price, :total_price
  end
end
