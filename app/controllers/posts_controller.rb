class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @posts=Post.all
    # @posts = Post.joins(:user).select('posts.*, users.email as user_email')

  end
  def new
    @post=current_user.post.build
    
  end 

  def create
    # puts Post.all
    # @post = Post.new(title: params[:post][:title])
    @post=current_user.post.build(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
