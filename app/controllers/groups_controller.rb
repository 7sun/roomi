class GroupsController < ApplicationController

  # def index
  #   @group = Group.where(:member_emails.in => [current_user.email])
  # end

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
      current_user.update(group_member: true)
      logger.info(current_user.errors.messages.inspect)
			if @group.save
				redirect_to group_path(@group.id)
			end
    else
        render :new
		end
	end

  def join
    current_user.update(group_member: true)
    if current_user.save
      redirect_to home_path
    else
      redirect_to home_path
    end
  end

  def destroy
  end

  def leave
    @group = Group.find(params[:id])
    @group.member_emails.delete(current_user)
  end

end
