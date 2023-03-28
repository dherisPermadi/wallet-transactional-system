class Team < ApplicationRecord
  has_secure_password

  has_one :wallet, as: :walletable, dependent: :destroy
  has_many :stocks, as: :stockable, dependent: :destroy
  has_many :transactions, as: :sourceable, dependent: :destroy

  validates :email, uniqueness: true
  validates_presence_of :email, :name
end
