class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action except: [:show] do
    authorize_request("admin")
  end

  def show
    @user = User.find(params[:id])
  end

  def admin_new_user
    @user = User.new
  end

  def admin_create_user
    @user = User.new(user_params)
    if @user.save
      redirect_to profile_path(@user)
    else
      render 'admin_new_user'
    end
  end

  def admin_delete_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to offers_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end




