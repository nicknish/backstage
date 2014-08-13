class UsersController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  before_action :header

  # How can I make it so the user can only access HIS/HER edit page?
  # Right now, if you go to the right URL you can access anyone's info.

  # Create a session from the index page.
  def index
    @users = User.all
    @user = User.new
    @is_login = true
  end

  # Add a new user
  def new
  	@user = User.new
  	@is_signup = true
  end

  # Save the user
  def create
  	user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
  	if user.save
      # Login the user if they are successful at signing up
      session[:user_id] = user.id.to_s
  		redirect_to root_path, notice: "Thank you for signing up!"
    else
      redirect_to new_path, notice: "There was a problem with your signup. Sorry about that!"
  	end
  end

  # Edit the user profile
  def edit
    if current_user.id == User.find(params[:id]).id
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: "Sorry you don't have access to that!"
    end
  end

  # Patch the user profile
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
      redirect_to edit_path, notice: "Your changes were saved!"
    else
      render 'edit'
    end
  end

  # Delete the user
  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_path, notice: "Sorry to see you go!"
  end

  def header
    @user_login = User.new
    @is_login = true
  end

  def sclogin
    s = params[:s]
    render json: s
  end

end
