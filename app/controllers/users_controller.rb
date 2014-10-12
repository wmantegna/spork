class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  	@preferences = Preference.all
  end

  def update
  	@user = User.find(params[:id])

		#get items from input and add to an array
		@prefs = Array.new
  	params[:prefs].each do |p|
      @prefs << Preference.find(p)
    end

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

    redirect_to @user
  end


  private
  def user_params
  	params.require(:user).permit(:name)
  end

end