class Post < ActiveRecord::Base
  belongs_to :user

  #TODO: save this in the DB when I can make migrations
  def html
    render_contents(self.content).html_safe
  end
  
  private
  def render_contents(src)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render src
  end
end
