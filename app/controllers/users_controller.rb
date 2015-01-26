class UsersController < ApplicationController

	def index
		@group = Group.where(:member_emails.in => [current_user.email]).first
		@total = sum_expenses
	end

	def sum_expenses
		if @group
			sum = 0
			@group.expenses.each do |i|
				sum += i.amount
			end
			sum
		end
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
		params.require(:user).permit(:email, :password, :name)
	end


end
