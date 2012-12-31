class CommentsController < ApplicationController
  before_action :set_comment, except: [ :index, :new, :create ]
  respond_to :html, :js

  def edit
  end

  # this works because the Rails has a ActionController::Responder with the logic
  def create
    new_params = comment_params.merge({ user_id: current_user.id })
    @comment = Comment.new(new_params)
    if @comment.save
      flash[:notice] = "Your comment was created" 
    end
    respond_with(@comment.post)
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Your comment was successfully updated."
    end
    respond_with(@post)
  end

  def destroy
    @comment.destroy
    respond_with(@comment) do |format|
      format.html { redirect_to post_url(@post) }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      @post = @comment.post
    end

    # Use this method to whitelist the permissible parameters. Example: params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
