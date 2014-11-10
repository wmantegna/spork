class Event < ActiveRecord::Base
	validates :name, presence: true
	validates :zip, presence: true
	
	belongs_to :restaurant

	belongs_to :host, class_name: 'User'
	has_and_belongs_to_many :users


	#
	# returns {prefID => count}
	# a hash of UsersRestrictions data
	# from users attending this event
	def eventRestrics
		@rCount_h = Hash.new

		# Get user data
		self.users.each do |u|

			u.restrictions.each do |r|
				
				@num = @rCount_h[r.id]

				if @num.nil? 
					@num = 1 
				else
					@num += 1
				end
				
				@rCount_h[r.id] = @num
			end
		end

		@rCount_h.sort
	end

	#
	# returns {prefName => weighted_count}
	# a hash of UsersRestrictions data
	# from users attending this event
	def eventRestrics_weighted
		@rCount_h = self.eventRestrics

		# order each outcome by value and sort
		@userCount = self.users.count
		@restrics_h = Hash.new

		@rCount_h.each do |r|
			@key = r[0]
			@val = r[1]
			unless @val == 0
				@restric = Restriction.find(@key)
				@weighted_val = (@val / @userCount.to_f).round(4)
				@restrics_h[@restric.name] = @weighted_val
			end
		end

		@restrics_h.sort_by{|key, value| value}
	end


	#
	# returns {restricID => count}
	# a hash of UsersPreferences data
	# from users attending this event
	def eventPrefs
		@pCount_h = Hash.new

		# Get user data
		self.users.each do |u|

			u.preferences.each do |p|
				@num = @pCount_h[p.id]

				if @num.nil? 
					@num = 1 
				else
					@num += 1
				end

				@pCount_h[p.id] = @num
			end
		end

		@pCount_h.sort
	end

	#
	# returns {restricName => weighted_count}
	# a hash of UsersPreferences data
	# from users attending this event
	def eventPrefs_weighted
		@pCount_h = self.eventPrefs

		# order each outcome by value and sort
		@userCount = self.users.count
		@prefs_h = Hash.new

		@pCount_h.each do |p|
			@key = p[0]
			@val = p[1]
			unless @val == 0
				@pref = Restriction.find(@key)
				@weighted_val = (@val / @userCount.to_f).round(4)
				@prefs_h[@pref.name] = @weighted_val
			end
		end

		@prefs_h.sort_by{|key, value| value}
	end
end