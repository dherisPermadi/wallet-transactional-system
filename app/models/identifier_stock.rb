class IdentifierStock < ApplicationRecord
  validates :symbol_name, :name, presence: true, uniqueness: true
end
