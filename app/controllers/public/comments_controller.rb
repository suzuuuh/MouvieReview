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

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
