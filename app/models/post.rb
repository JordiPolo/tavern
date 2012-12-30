class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id', :inverse_of => :posts
  paginates_per 10

  default_scope order('created_at DESC')
  scope :for, lambda {|current_user| where('access = ? OR access = ? AND user_id = ?', 'restricted', 'private', current_user.id)   }

  def self.defaults
    { access: 'restricted' }
  end

  #TODO: save this in the DB?
  def html
    Markdown.render(self.content)
  end

  def public_access?
    access == 'public'
  end

  def private?
    access == "private"
  end
  
end
