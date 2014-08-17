class UsersController < ApplicationController
  # If a user isn't logged in, then deny them access to user edit and update pages.
  before_filter :authorize, only: [:edit, :update]
  # Allow the login and signing up on any page.
  before_action :login, :new

  # MUSIC PLAYER
  def index
    if current_user
      @users = User.all.order("completed ASC")
    else
      redirect_to root_path, notice: "Thanks for your interest. Log in or Sign up first!"
    end
  end

  # SAVE
  def create
  	user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
  	if user.save
      # Login the user if they are successful at signing up
      session[:user_id] = user.id.to_s
  		redirect_to users_path, notice: "Thank you for signing up!"
    else
      redirect_to root_path, notice: "There was a problem with your signup. Sorry about that!"
  	end
  end

  # EDIT
  def edit
    if current_user.id == User.find(params[:id]).id
      @user = User.find(params[:id])
    else
      redirect_to users_path, notice: "Sorry you don't have access to that!"
    end
  end

  # PATCH
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
      redirect_to edit_path, notice: "Your changes were saved!"
    else
      render 'edit'
    end
  end

  # DELETE
  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_path, notice: "Sorry to see you go!"
  end

  # API
  respond_to :json

   def sclogin
    url = params[:s]
    # render json: url
    @user = User.new(params.require(:user).permit(:name))
    if @user.save
      respond_to do |format|
        format.JSON { render :json => @user }
      end
    end
   end

end
