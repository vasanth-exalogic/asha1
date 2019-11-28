class UsersController < ApplicationController
  before_action :find_user, except: [:index, :create, :new]
  before_action :is_admin?, except: [:show]
  before_action :is_user?, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @error3
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      @error3='Please enter proper Email-id and Password'
      render 'new'
    end
  end

  def edit
  end

  def update
    @error4
    if @user.update(user_params)
      redirect_to @user
    else
      @error4='Please enter proper Email-id and Password'
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to '/users'
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:fname,:lname,:datebirth,:datejoining,:age,:sal,:salpm,:contact,:bloodtype,
    :address,:city,:state,:country,:pincode,:gender,:ename,:relation,:econtact,:pskill,:sskill,:sskill2,
    :notice,:email,:password,:password_confirmation)
  end

  def is_admin?
    if session[:user_type]!='admin'
      redirect_to root_path
    end
  end

  def is_user?
    unless session[:user_id]==@user.id || session[:user_type]=='admin'
      redirect_to root_path
    end
  end
end
