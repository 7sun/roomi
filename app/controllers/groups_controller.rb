class GroupsController < ApplicationController

  def index
    @groups = Group.where(home_type: "apartment")
  end

	def new
		@group = Group.new
    # @user = User.find_by(session[:user_id])
	end

  def show  
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group
  end

	def create
    @group = Group.new(params.require(:group).permit(:name, :home_type, :address))
		if @group.valid?
      @group.member_emails = params[:group][:member_emails].gsub(" ", "").split(',').unshift(current_user.email)
      @group.owner_id = current_user.id
      # password_params = params.require(:group).permit(:password)
      current_user.update(group_member: true)
      logger.info(current_user.errors.messages.inspect)
			if @group.save
				redirect_to group_path(@group.id)
			end
    else
        render :new
		end
	end

end
