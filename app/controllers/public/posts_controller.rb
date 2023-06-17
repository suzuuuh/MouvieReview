class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @user = current_user
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @post = current_user.posts.build(post_params)
    @movie = @post.movie
    if @post.save
      flash[:notice] = "You have created movie successfully."
      redirect_to movie_path(@movie)
    else
      @posts = @movie.posts
      flash.now[:alert] = "faild"
      render 'public/movies/show'
    end
  end

  def confirm
  end

  def complete
  end

  def index
    @post = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
    @movie = @post.movie
    @comment = Comment.new(post_id: @post.id)
    @comments = @post.comments
  end

  def edit
    @post = current_user.posts.build(post_params)
    @user = @post.user
  end

  def destroy
    post = Post.find(params[:id])
  if post.user_id == current_user.id
   post.destroy
  end
  redirect_back(fallback_location: root_path)
  end

  def update
    @post = current_user.posts.build(post_params)
    @movie = @post.movie
    if @post.update(post_params)
      flash[:notice] = "You have created movie successfully."
      redirect_to movie_path(@movie)
    else
      @posts = @movie.posts
      flash.now[:alert] = "faild"
      render 'public/movies/show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:review, :movie_id,)
  end
end
