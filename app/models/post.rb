class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id', :inverse_of => :posts

  #TODO: save this in the DB when I can make migrations
  def html
    Markdown.render(self.content)
  end
  
end
