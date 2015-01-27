class RestricsController < ApplicationController

  # GET /restrics/new
  def new
    @restric = Restric.new

    @user = User.find(params[:user_id])
    @restrictions = Restriction.order(:name).all
    @userRestrics = ""
    @user.restrictions.each do |r|
      @userRestrics += r.id.to_s + ","
    end
  end

  # POST /restrics
  # POST /restrics.json
  def create
    @user = User.find(params[:user_id])
    @restrictions = params[:restrics]

    # remove all userRestrictions not included in params[:restrics]
    @user.restrictions.each do |r|
      unless @restrictions.include? (r)
        RestrictionsUsers.where(user_id: @user, restriction_id: r).first.destroy
      end
    end

    # if userRestric is in params but not DB, add it
    unless @restrictions.nil?
      @restrictions.each do |r|
        unless @user.restrictions.exists? (r)
          @user.restrictions << Restriction.find(r)
        end
      end
    end

    redirect_to new_user_pref_path(@user)
  end

end
