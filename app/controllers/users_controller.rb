class UsersController < ApplicationController
  def index
    @users = User.all
    # Create a session from the index page.
    @user = User.new
    @is_login = true
  end

  # Prepare to show the sign-up form
  def new
  	@user = User.new
  	@is_signup = true
  end
  # Actually build the user
  def create
  	user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
  	if user.save
  		redirect_to root_path
    else
      redirect_to new_path
  	end
  end

  def edit
    
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
      redirect_to edit_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    # Exactly the same idea as this little number:
    redirect_to root_path
   
   private 

   # How can I make it so the user can only access HIS/HER edit page?
   # Right now, if you go to the right URL you can access anyone's info.

      def check_admin
        unless current_user && current_user.is_admin
        redirect_to events_path
        end
      end

  end
end
