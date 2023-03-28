class IdentifierStock < ApplicationRecord
  belongs_to :indices_stock

  validates :symbol_name, :name, presence: true, uniqueness: true

  def latest_price
    identifier = LatestStockPrice.new(indices_stock.name, name).price

    return identifier.any? ? identifier[0]['lastPrice'] : 0
  end
end
