class WelcomeController < ApplicationController
	# Allow the login and signing up on any page.
	before_action :login, :new
end
