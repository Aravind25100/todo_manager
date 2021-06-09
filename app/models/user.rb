class User < ApplicationRecord
  has_secure_password

  has_many :todos

  def to_pleasent_string
    "#{id}. User: #{first_name} #{last_name} and e-mail: #{email}"
  end
end
