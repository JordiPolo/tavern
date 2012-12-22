class User < ActiveRecord::Base
  has_many :posts, :inverse_of => :author

  def name
    "#{first_name} #{last_name}"
  end
end
