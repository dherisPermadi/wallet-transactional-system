class Wallet < ApplicationRecord
  has_many :wallet_transactions, dependent: :destroy
  belongs_to :walletable, polymorphic: true, optional: true

  def balance
    wallet_transactions.sum(:amount).to_f
  end
end
