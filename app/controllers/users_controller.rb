class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_input)
    if @user.save
      session[:user_id] = @user.id
      log_in
      flash[:success] = 'Successfully Created User!'
      redirect_to root_url
    else
      flash.now[:danger] = 'Something Went Wrong!'
      render 'new'
    end
  end

  def show
  end

  private
  def user_input
    params.require(:user).permit(:username, :email)
  end
end
