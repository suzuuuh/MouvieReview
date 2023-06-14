class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
    @movie = @post.movie
    @comment = Comment.new(post_id: @post.id)
    @comments = @post.comments
  end

  def new
  end

  def index
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_root_path
  end

end
