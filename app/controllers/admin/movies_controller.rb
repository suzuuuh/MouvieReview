class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def edit
    @movie = Movie.find(params[:id])
    @genres = Genre.all
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
    flash[:notice] = "You have created movie successfully."
    redirect_to admin_movies_path
    else
      render :index
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "You have created movie successfully."
      redirect_to admin_movie_path(@movie)
    else
      render 'admin/movies/show'
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to admin_movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :introduction, :genre_id)
  end


end
