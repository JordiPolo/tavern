class CommentPresenter < BasePresenter
  presents :comment

  def author_says
     comment.author.name + " says:" if comment.author
  end

  def information
    h.link_to( post.author.name, h.user_path(post.author) ) + " posted " + h.time_ago_in_words(post.created_at)  + " ago "
  end

  def actions_for(user)
    if user == comment.author
    #  h.link_to( 'Edit', h.edit_comment_path(post) ) + " | " + 
      h.link_to( 'Destroy', comment, method: :delete, data: { confirm: 'Are you sure?' })
    end
  end

end
