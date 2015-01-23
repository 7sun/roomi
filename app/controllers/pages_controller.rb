class PagesController < ApplicationController

	def home
		redirect_to expenses_path if current_user
	end

end