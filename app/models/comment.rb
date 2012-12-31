class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :post
  validates_presence_of :content

  #TODO: save this in the DB?
  def html
    Markdown.render(self.content)
  end

end
