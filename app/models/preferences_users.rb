class PreferencesUsers < ActiveRecord::Base
	belongs_to :users
	belongs_to :preferences
end