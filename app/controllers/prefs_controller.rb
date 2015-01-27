class PrefsController < ApplicationController
  def new
  	@pref = Pref.new

  	@user = User.find(params[:user_id])
  	@preferences = Preference.order(:name).all
    @userPrefs = ""
    @user.preferences.each do |p|
      @userPrefs += p.id.to_s + ","
    end
  end

  def create
  	@user = User.find(params[:user_id])
    @preferences = params[:prefs]

    # remove all userPreferences not included in params[:prefs]
    @user.preferences.each do |p|
      unless @preferences.include? (p)
        PreferencesUsers.where(user_id: @user, preference_id: p).first.destroy
      end
    end

    # if userPref is in params but not DB, add it
    unless @preferences.nil?
      @preferences.each do |p|
        unless @user.preferences.exists? (p)
          @user.preferences << Preference.find(p)
        end
      end
    end

    redirect_to root_path
  end

end
