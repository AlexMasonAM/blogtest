class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :asc)
    @new_comment = Comment.new
  end
  
  def new
    @post = Post.new 
  end 

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

end
