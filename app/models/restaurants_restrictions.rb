class RestaurantsRestrictions < ActiveRecord::Base
	belongs_to :restaurants
	belongs_to :restrictions
end
