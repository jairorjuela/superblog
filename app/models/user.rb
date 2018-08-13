class User < ApplicationRecord
  has_secure_password validations: false

  has_many :products
  has_many :comments

  validates :email, uniqueness: true, format: /@/
  validates :password, presence: true, on: :create
  validates :password, length: { in: 6..20 }, allow_nil: true
  validates :name, presence: true
end
