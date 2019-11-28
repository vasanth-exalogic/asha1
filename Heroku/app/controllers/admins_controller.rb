class AdminsController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @create_error
    user = User.new(user_params)
    if user.role == 'admin' && user.save
      redirect_to '/admins'
    elsif user.role == 'user' && user.save
      session[:id] = user.id
      redirect_to '/users/new'
    else
      @create_error = "Please enter valid credentials"
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/admins'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

end
