class Event < ActiveRecord::Base
	validates :name, presence: true
	validates :zip, presence: true
	
	belongs_to :restaurant
	has_and_belongs_to_many :users

	belongs_to :host, class_name: 'User'
end
