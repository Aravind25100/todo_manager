class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, { presence: true, uniqueness: true }
  validates :first_name, length: { minimum: 4 }

  has_many :todos
end
