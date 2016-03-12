class SessionsController < ApplicationController
  def new
  end

  def create
		@user_login = User.find_by(name: params[:name])

    if @user_login && @user_login.authenticate(params[:password])
        session[:user_id] = @user_login.id
	 session[:name] = @user_login.name
      
        redirect_to root_path
    else
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end