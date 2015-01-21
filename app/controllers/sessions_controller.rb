class SessionsController < ApplicationController


def create
		user = User.find_by(email: params[:user][:email])
	if user && user.authenticate(email: params[:user][:email])
		session[:user_id] = user.id.to_s
		redirect to expenses_path
	else
		render :new
	end
end


end