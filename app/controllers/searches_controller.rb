class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @range = "Movie"
    @movies = Movie.looks(params[:search], params[:word])
    #@movies = Movie.where("name LIKE?","%#{params[:word]}%")
    @message = ""
    if @movies.empty?
      @message = "該当作品なし"
    end
  end

end
