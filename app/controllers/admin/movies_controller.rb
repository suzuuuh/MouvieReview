class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @movies = Movie.all
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
    flash[:notice] = "You have created movie successfully."
    redirect_to movies_path
    else
      render :index
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :introduction, :genre_id)
  end


end
