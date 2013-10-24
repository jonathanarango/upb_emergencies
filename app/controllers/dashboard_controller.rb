class DashboardController < ApplicationController
	before_filter :authenticate_system_user!
	layout "private"
	before_filter :set_current_system_user
	
 	def index
		
  end

end
