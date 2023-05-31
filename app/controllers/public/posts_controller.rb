class Public::PostsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
    flash[:notice] = "You have created movie successfully."
    redirect_to movies_path
    else
      render :index
    end
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :introdction)
  end


end
