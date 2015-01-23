class GroupsController < ApplicationController

  def index
  end

	def new
		@group = Group.new
    # @user = User.find_by(session[:user_id])
	end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group
  end

	def create
		@group = Group.new(params.require(:group).permit(:name, :home_type, :member_emails))
    @group.owner_id = current_user.id
		if @group.valid?
			if @group.save
				redirect_to expenses_path
			end
		end
	end



end