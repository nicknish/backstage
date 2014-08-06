class UsersController < ApplicationController
  def index
    @users = User.all
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
  		redirect_to users_path
  	end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    User.find(params[:id]).destroy
    # Exactly the same idea as this little number:
    redirect_to customers_path
  end

end
