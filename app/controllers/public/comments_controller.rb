class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user_id != current_user.id
      redirect_to root_path
    end
    @user = @comment.user
    @movie = @comment.post.movie
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    if @comment.save
      flash[:notice] = "You have created comment successfully."
      redirect_to post_path(@post)
    else
      @comments = @post.comments
      @movie = @post.movie
      flash.now[:alert] = "faild"
      render 'public/posts/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  def update
    @comment = Comment.find(params[:id])
    @movie = @comment.post.movie
    if @comment.update(comment_params)
      flash[:notice] = "You have created movie successfully."
      redirect_to post_path(@comment.post.id)
    else
      @comments = @movie.posts
      flash.now[:alert] = "faild"
      render 'public/movies/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
