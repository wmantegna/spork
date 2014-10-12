class Restaurant < ActiveRecord::Base
	has_and_belongs_to_many :preferences
	has_and_belongs_to_many :restrictions
	has_many :events
end