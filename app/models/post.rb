class Post < ActiveRecord::Base
  belongs_to :user

  #TODO: save this in the DB when I can make migrations
  def html
    Markdown.render(self.content)
  end
  
end
