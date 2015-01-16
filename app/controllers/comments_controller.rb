class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params.require(:comment).permit(:body, :post_id))

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_to post_path(@comment.post)
    end
  end
end
