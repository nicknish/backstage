class SessionsController < ApplicationController
	def new
		@user = User.new
		@is_login = true
	end

	def create
		u = User.where(email: params[:user][:email]).first
		# First make sure we actually found a user
		# Then, see if their password matches
		if u && u.authenticate(params[:user][:password])
			# sets a  cookie at the user that holds the logging in user ID
			session[:user_id] = u.id.to_s
			redirect_to users_path
		else
			# if wrong, then reloads to try logging in
			redirect_to new_session_path
		end
	end

	def destroy
		# Kill all of our cookies, log out
		reset_session
		redirect_to new_session_path
	end
end