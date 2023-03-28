class AddIndicesStockIdToIdentifierStocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :identifier_stocks, :indices_stock, index: true
  end
end
