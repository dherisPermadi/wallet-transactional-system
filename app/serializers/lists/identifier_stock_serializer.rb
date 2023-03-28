module Lists
  # serializer class for list of identifier stock
  class IdentifierStockSerializer < ActiveModel::Serializer
    attributes :id, :name, :indices_stock
  end
end
