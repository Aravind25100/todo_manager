class User < ActiveRecord::Base
  def to_pleasent_string
    "#{id}. User : #{first_name} #{last_name} and e-mail: #{email}"
  end
end
