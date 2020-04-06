class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user 
      session[:user_id] = user.id
      flash[:success] = 'Successfully Created User!'
      redirect_to root_url
    else
      flash[:error] = 'Successfully Created User!'
      render 'new'
    end
  end
end
