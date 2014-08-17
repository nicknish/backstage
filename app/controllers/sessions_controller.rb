class SessionsController < ApplicationController

	def create
		user = User.where(email: params[:user][:email]).first
		# First make sure we actually found a user
		# Then, see if their password matches
		if user && user.authenticate(params[:user][:password])
			# sets a cookie on the browser that holds the logging in user ID
			session[:user_id] = user.id.to_s
			redirect_to users_path, notice: "Logged in!"
		else
			# if wrong, then reloads with an error message
			redirect_to root_path, notice: "Email or password is incorrect"
		end
	end

	def destroy
		# Kill all of our cookies, log out
		reset_session
		redirect_to root_path, notice: "You're logged out!"
	end
end