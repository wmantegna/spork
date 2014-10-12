class RestrictionsUsers < ActiveRecord::Base
	belongs_to :users
	belongs_to :restrictions
end