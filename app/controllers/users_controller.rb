class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  	@preferences = Preference.all
  	@restrictions = Restriction.all
  end

  def update
  	################################################
  	##              Preferences
  	################################################
		#get items from input and add to an array
		@prefs = params[:prefs]

    #if event item is NOT in array, remove it from event
    @user.preferences.each do |p|
      unless @prefs.include? (p)
        PreferencesUsers.where(user_id: @user, preference_id: p).first.destroy
      end
    end

    #if item is NOT in event array, add it to event
    @prefs.each do |p|
      unless @user.preferences.exists? (p)
        @user.preferences << Preference.find(p)
      end
    end
		################################################


		################################################
  	##              Restrictions
  	################################################
		#get items from input and add to an array
		@restrics = params[:restrics]

    #if event item is NOT in array, remove it from event
    @user.restrictions.each do |r|
      unless @restrics.include? (r)
        RestrictionsUsers.where(user_id: @user, restriction_id: r).first.destroy
      end
    end

    #if item is NOT in event array, add it to event
    unless @restrics.nil?
      @restrics.each do |r|
        unless @user.restrictions.exists? (r)
          @user.restrictions << Restriction.find(r)
        end
      end
    end
  	################################################
    redirect_to @user
  end



  ############################
  ###      FINAL UI        ###
  ############################
  def results
    @user = User.find(params[:id])
    @restaurants = Restaurant.limit(3).all
  end
  ############################

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
  	params.require(:user).permit(:name)
  end

end