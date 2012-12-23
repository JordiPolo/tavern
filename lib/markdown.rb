
class HTMLWithSyntaxHighlight < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div( line_numbers: :table, line_number_anchors: false)
  end
end

class Markdown
  #this method is used by rails to automatically conver .md files to html
  def self.call(template)
    #we call inspect so it is quoted and considered ruby code as Rails expect that
    self.render(template.source).inspect
  end

  #human readable method
  def self.render(src)
    renderer = HTMLWithSyntaxHighlight.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true 
    }
    redcarpet = Redcarpet::Markdown.new(renderer, options)
    redcarpet.render( src ).html_safe
  end
end
