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
    h.link_to( post.author.name, h.user_path(post.author) ) + " posted " + h.time_ago_in_words(post.created_at)  + " ago "
  end

  def actions_for(user)
    if user == post.author
      h.link_to( 'Edit', h.edit_post_path(post) ) + " | " + 
      h.link_to( 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' })
    end
  end

end
