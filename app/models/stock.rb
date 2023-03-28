class Stock < ApplicationRecord
  belongs_to :identifier_stock
  belongs_to :stockable, polymorphic: true
  has_one :wallet, as: :walletable, dependent: :destroy
  has_many :transactions, as: :sourceable, dependent: :destroy

  validates :quantity, numericality: { greater_than: 0 }
  validates :unit_price, numericality: { greater_than: 0 }
  validates :total_price, numericality: { greater_than: 0 }

  def stockable_name
    stockable.name
  end

  def wallet_balance
    wallet&.balance
  end
end
