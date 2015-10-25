# Class that deals with sessions
class SessionsController < ApplicationController
  
  # GET /signin
  def new
  end

  # POST /signin
  def create
    user = User.where(name: params[:signin][:name]).first

    if user && user.authenticate(params[:signin][:password])
      flash[:notice] = 'Signed in successfully.'

      redirect_to root_url
    else
      flash[:error] = 'Sorry.'
      render :new
    end
  end

  # GET /signout
  def destroy
    @_current_user = session[:user_id] = nil
    flash[:notice] = 'Signed out successfully.'

    redirect_to root_url
  end

  private

  # set up the current user
  def current_user
    @_current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end
end
