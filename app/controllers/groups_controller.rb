class GroupsController < ApplicationController

  # def index
  #   @group = Group.where(:member_emails.in => [current_user.email])
  # end

	def new
		@group = Group.new
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
				redirect_to home_path
			end
    else
        render :new
		end
	end

  def destroy(group)
    @group = group
    @group.destroy
    redirect_to home_path
  end

  def join
    current_user.update(group_member: true)
    if current_user.save
      redirect_to home_path
    else
      redirect_to home_path
    end
  end

  def leave #Need to test functionality
    @group = Group.find(params[:id])
    @group.member_emails.delete(current_user)
    current_user.update(group_member: false)
  end

end
