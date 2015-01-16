class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post_id = params[:post_id]
    @comment.save     
    redirect_to post_path(@comment.post)
    
  end
end
