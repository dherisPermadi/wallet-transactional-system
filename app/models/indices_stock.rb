class IndicesStock < ApplicationRecord
  has_many :identifier_stock

  validates :name, presence: true, uniqueness: true
end
