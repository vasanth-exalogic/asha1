class SessionsController < ApplicationController

  def index
  end

  def create
    @login_error
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:type] = user.role
      if user.role == 'admin'
        redirect_to '/admins'
      else
        redirect_to user
      end
    else
      @login_error = "Invalid Credentials"
      render 'index'
    end
  end

  def destroy
    session[:type]=nil
    render 'index'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
