class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user 
      session[:user_id] = user.id
      log_in
      flash[:success] = "welcome back, #{user.username}!"
      redirect_to root_url
    else
      flash.now[:danger] = 'Oops made a mistake somewhere'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully Logged Out'
    redirect_to root_url
  end
end
