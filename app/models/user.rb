<<<<<<< HEAD
class User < ActiveRecord::Base
  def to_pleasent_string
    "#{id}. User : #{first_name} #{last_name} and e-mail: #{email}"
  end
=======
class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, length: { minimum: 4 }

  has_many :todos
>>>>>>> level8
end
