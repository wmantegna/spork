class PreferencesRestaurants < ActiveRecord::Base
	belongs_to :restaurants
	belongs_to :preferences
end