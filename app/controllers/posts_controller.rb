class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @user = current_user
    @post = @user.posts.create(params[:post])
    redirect_to post_path(@user, @post)
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def destroy
    raise "TODO"
  end


end
