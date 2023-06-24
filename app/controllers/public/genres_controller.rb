class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @message = ""
    @movies = @genre.movies
    if @movies.empty?
      @message = "該当作品なし"
    end
  end
end
