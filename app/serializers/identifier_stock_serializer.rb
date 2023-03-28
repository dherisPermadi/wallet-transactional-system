# serializer class for identifier stock
class IdentifierStockSerializer < ActiveModel::Serializer
  attributes :id, :indices_stock, :symbol_name, :name, :latest_price,
             :created_at, :updated_at
end
