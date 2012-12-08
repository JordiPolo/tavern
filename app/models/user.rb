class User < ActiveRecord::Base
  has_many :posts

  def name
    "#{first_name} #{last_name}"
  end
end
