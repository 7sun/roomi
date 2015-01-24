class UsersController < ApplicationController

	def index
	end


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.group_member = false
		if @user.valid?
			if @user.save
				redirect_to login_path
			end
		else
			render :new
		end
	end

	def user_params
		params.require(:user).permit(:email, :password)
	end

end
