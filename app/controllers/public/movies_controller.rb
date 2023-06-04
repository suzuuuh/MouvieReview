class Public::MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
