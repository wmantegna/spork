class Event < ActiveRecord::Base
	validates :name, presence: true
	validates :zip, presence: true
	
	belongs_to :restaurant

	belongs_to :host, class_name: 'User'
	has_and_belongs_to_many :users


	#
	# returns a hash of UsersRestrictions data
	# from users attending this event
	def eventRestrics
		@userRestrics = Array.new(Restriction.all.count, 0)

		# Get user data
		self.users.each do |u|

			u.restrictions.each do |r|
				@num = @userRestrics[r.id-1]
				@userRestrics[r.id-1] = ++@num
			end

		end
		
		# order each outcome by value and sort
		@userCount = self.users.count
		@restrics_h = Hash.new

		@userRestrics.each do |r|
			unless r == 0
				@restric = Restriction.find(r)
				@value = r = r / @userCount

				@restrics_h[@restric.name] = @value
			end
		end

		@restrics_h.sort_by{|key, value| value}
	end


	#
	# returns a hash of UsersPreferences data
	# from users attending this event
	def eventPrefs
		@userPrefs = Array.new(Preference.all.count, 0)

		# Get user data
		self.users.each do |u|

			u.preferences.each do |p|
				@num = @userPrefs[p.id-1]
				@userPrefs[p.id-1] = ++@num
			end

		end

		# order each outcome by value and sort
		@userCount = self.users.count
		@prefs_h = Hash.new


		@userPrefs.each do |p|
			unless p == 0
				@pref = Preference.find(p)
				@value = p / @userCount

				@prefs_h[@pref.name] = p / @userCount
			end
		end

		@prefs_h.sort_by{|key, value| value}
	end
end