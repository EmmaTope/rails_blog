class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_email.downcase)

    if user && user.authenticate(session_password)
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to user
    else
      flash.now[:danger] = 'Your email address or password were not recognised.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out successfully.'
    redirect_to root_path
  end

  private

  def session_password
    params[:session][:password]
  end

  def session_email
    params[:session][:email]
  end

end
