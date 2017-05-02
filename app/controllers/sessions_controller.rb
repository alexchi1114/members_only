class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		#If the user exists and the password is correct, 
		#log the user in and redirect to user page.
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_to user
		else
			flash.now[:danger] = "Invald email and/or password"
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end
