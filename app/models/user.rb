class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates_presence_of :email, :first_name
end
