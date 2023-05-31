class Admin::MoviesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @movie = Movie.new
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
    params.require(:movie).permit(:name, :introduction)
  end


end
