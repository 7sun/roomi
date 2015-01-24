class SessionsController < ApplicationController

	def create
			user = User.find_by(email: params[:user][:email])
			# logger.info("params: #{params.inspect}") SAME AS CONSOLE LOG
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id.to_s
			redirect_to home_path
		else
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end

end
