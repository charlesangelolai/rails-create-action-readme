class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    find_post
  end
  
  def new
    @post = Post.new
  end
  
  # add create method here
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end
end
