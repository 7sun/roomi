class UsersController < ApplicationController

	def index
		@group = Group.where(:member_emails.in => [current_user.email]).first
		@total = sum_expenses
		# @group_link = get_group_link
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

	# def get_group_link
	# 	if current_user.id.to_s == @group.owner_id.to_s
	# 		group_link = ['Delete Group', "" 'method: destroy']
	# 	else
	# 		group_link = ['Leave Group', 'groups#edit']
	# 	end
	# end

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
