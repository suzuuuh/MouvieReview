class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    @range = "Movie"
      @movies = Movie.looks(params[:search], params[:word])
  end

end
