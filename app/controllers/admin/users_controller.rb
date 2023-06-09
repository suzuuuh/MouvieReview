class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def confirm
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      flash[:notice] = "You have created book successfully."
    redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  def withdraw
    @user = User.find(params[:id])
    @users = User.all
    @user.update(is_deleted: true)
    render :index
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :profile_image, :age, :sex, :email)
  end

end


