class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @message = ""
    if @genre.empty?
      @message = "該当作品なし"
    end
  end
end
