class User < ApplicationRecord
  has_secure_password

  has_one :wallet, as: :walletable, dependent: :destroy
  has_many :stocks, as: :stockable, dependent: :destroy
  has_many :transactions, as: :sourceable, dependent: :destroy

  validates :email, uniqueness: true
  validates_presence_of :email, :first_name

  def name
    last_name.present? ? "#{first_name} #{last_name}" : first_name
  end
end
