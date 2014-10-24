class RestrictionsUsersController < ApplicationController

	def index
		raise
		@user = User.find(params[:user_id])
		@restrictions = Restriction.all
	end

	def new
		@user = User.find(params[:user_id])
		@users_restrictions = RestrictionsUsers.new
		@restrictions = Restriction.all
	end

	def create
		raise
	end

	def edit
		@user = User.find(params[:user_id])
		@restrictions = Restriction.all
	end

	def update
		raise
	end
end
