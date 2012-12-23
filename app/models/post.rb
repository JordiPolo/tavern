class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id', :inverse_of => :posts

  #TODO: save this in the DB when I can make migrations
  def html
    Markdown.render(self.content)
  end

  def published=(status)
    if status == true
      access='domain'
    else
      access='private'
    end

  end

  def public?
    access == 'internet'
  end

  def published?
    access == "domain"
  end

  def draft?
    access == "private"
  end

  def access=(new_access)
    @access= new_access
  end
  def access
    @access||"domain"
  end
  
end
