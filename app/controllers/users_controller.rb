# Class that deals with users
class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'You have signed up successfully.'
      redirect_to teams_path
    else
      render :new
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = 'Profile has been updated.'

      redirect_to user_path(@user)
    else
      flash[:alet] = 'Profile has not been updated.'

      render 'edit'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
