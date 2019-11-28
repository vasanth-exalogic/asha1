class SessionsController < ApplicationController
  def index
  end

  def create
    @error1
    @user = User.find_by_email(userparams[:email])
    if @user && @user.authenticate(userparams[:password])
      session[:user_id]=@user.id
      redirect_to @user
    else
      @error1='Invalid Email-id/Password'
      render 'index'
    end
  end

  private

  def userparams
    params.require(:user).permit(:email,:password)
  end
end
