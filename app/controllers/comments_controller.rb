class CommentsController < ApplicationController
  def create
    # render plain: params #shows all parameters for testing

    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params)
    redirect_to post_path(comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, commenter_attributes: [:name, :email])
  end

end

# Alternate Method to create and attach comments to specifc posts

  # def create
  #   @comment = Comment.new(params.require(:comment).permit(:body))
  #   @comment.post_id = params[:post_id]
  #   @comment.save     
  #   redirect_to post_path(@comment.post)
      
  # end