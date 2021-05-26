class User < ActiveRecord::Base
  def to_pleasent_string
    "#{id}. User: #{name} and e-mail: #{email}"
  end
end
