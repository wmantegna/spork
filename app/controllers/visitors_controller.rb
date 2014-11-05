class VisitorsController < ApplicationController
	
	def index
		if user_signed_in? && !current_user.events.empty?
			@upcomingEvents = current_user.events.where("date >= #{Date.today}").order("date DESC")
			@pastEvents = current_user.events.limit(3).where("date < #{Date.today}").order("date DESC")
		end
	end

end
