class UsersController < ApplicationController

  def index
    @user = User.find(session[:id])
  end

  def new
    @user = User.find(session[:id])
  end

  def create
    @msg
    @user = User.find(session[:id])
    if dob?(params[:user][:datebirth])
        if @user.update(user_params)
          redirect_to @user
        else
          @msg="Invalid credentials"
          render 'index'
        end
    else
      @msg="Users above 18 years are only allowed"
      render 'index'
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
      @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to '/admins'
    end
  end

  def show
    @user=User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:fname,:lname,:datebirth,:datejoining,:sal,:contact,:bloodtype,:address,
    :city,:state,:country,:pincode,:gender,:ename,:relation,:econtact,:pskill,:sskill,:sskill2,:notice,:role)
  end

  def dob?(date)
    (((Date.today-date.to_date)/365).to_i>=18)
  end
end
