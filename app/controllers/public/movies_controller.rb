class Public::MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @post = Post.new(movie_id: @movie.id)
    @posts = @movie.posts
  end
  
end
