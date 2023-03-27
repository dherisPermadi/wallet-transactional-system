class Team < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates_presence_of :email, :name
end
