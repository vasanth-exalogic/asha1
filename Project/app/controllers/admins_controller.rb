class AdminsController < ApplicationController
  def index
  end

  def create
    @error2
    admin = Admin.find_by_email(adminparams[:email])
    if admin && admin.authenticate(adminparams[:password])
      session[:user_type]='admin'
      redirect_to '/users'
    else
      @error2='Invalid Email-id/Password'
      render 'index'
    end
  end

  def destroy
    session[:user_type] = nil
    redirect_to root_path
  end

  private

  def adminparams
    params.require(:admin).permit(:email,:password)
  end
end
