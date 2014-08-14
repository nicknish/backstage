class SessionsController < ApplicationController

	def create
		u = User.where(email: params[:user][:email]).first
		# First make sure we actually found a user
		# Then, see if their password matches
		if u && u.authenticate(params[:user][:password])
			# sets a  cookie at the user that holds the logging in user ID
			session[:user_id] = u.id.to_s
			redirect_to users_path, notice: "Logged in!"
		else
<<<<<<< HEAD
=======
			# if wrong, then reloads with an error message
>>>>>>> 5d3dcca9fa70b96ae9033f1ed6b8373e9cbea6e8
			redirect_to root_path, notice: "Email or password is incorrect"
		end
	end

	def destroy
		# Kill all of our cookies, log out
		reset_session
		redirect_to root_path, notice: "You're logged out!"
	end
end