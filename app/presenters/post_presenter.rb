class PostPresenter < BasePresenter
  presents :post

  def access_info
    if post.private?
      text = 'private'
      klass = 'label label-warning'
    elsif post.public_access?
      text = 'PUBLIC'
      klass = 'label label-important'
    else
      text = ''
      klass = 'hidden'
    end
    h.content_tag( :span, text, :class => klass)
  end

  def information
    author_link =  h.link_to( post.author.name, h.user_path(post.author) )
    time =  h.time_ago_in_words(post.created_at)  + " ago "
    comments = (icon('icon-comment icon-white') + post.comments.count.to_s ).html_safe
    author_link + " posted " + time + comments
  end

  def actions_for(user)
    if user == post.author
      h.link_to( 'Edit', h.edit_post_path(post) ) + " | " + 
      h.link_to( 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' })
    end
  end

  def icon(name)
    "<i class='#{name}'></i> " 
  end

end
