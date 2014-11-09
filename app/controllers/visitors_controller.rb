class VisitorsController < ApplicationController
	
	def index
		if user_signed_in? && !current_user.events.empty?
			
			@upcomingEvents = current_user.upcomingEvents
			@pastEvents = current_user.pastEvents
			
		end
	end

end
