class User < ApplicationRecord
  has_many :links
  validates :email, uniqueness: true
  has_secure_password
end
