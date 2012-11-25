class PostsController < ApplicationController

  # Display all posts
  #
  def index
    @posts = Post.all
  end

  # Create a post for the current user.
  #
  def create
    @user = current_user
    @post = @user.posts.create(params[:post])
    redirect_to post_path(@user, @post)
  end

  # Let the current user make a new post.
  #
  def new
    @user = current_user

    # Must be logged in to post things.
    if @user
      @post = @user.posts.new

      # create 1 new image, this is the max number of images users
      # can upload.
      1.times { @post.images << Image.new }

      render :post
    else
      redirect_to login_path
    end

    @editing = true
  end

  # Show a specific post.
  #
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    render :post
  end

  # Destory ond of the current users posts, only if nobody has
  # bid on it.
  #
  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])

    @post.destroy #if @post.bids.empty?
  end


end
