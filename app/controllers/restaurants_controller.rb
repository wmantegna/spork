class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @preferences = Preference.all
    @restrictions = Restriction.all
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
    @preferences = Preference.all
    @restrictions = Restriction.all
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)


    ################################################
    ##              Preferences
    ################################################
    #get items from input and add to an array
    @prefs = Array.new
    unless params[:prefs].nil?
      params[:prefs].each do |p|
        @prefs << Preference.find(p)
      end
    end

    #if event item is NOT in array, remove it from event
    @restaurant.preferences.each do |p|
      unless @prefs.include? (p)
        PreferencesRestaurants.where(restaurant_id: @restaurant, preference_id: p).first.destroy
      end
    end

    #if item is NOT in event array, add it to event
    @prefs.each do |p|
      unless @restaurant.preferences.exists? (p)
        @restaurant.preferences << Preference.find(p)
      end
    end
    ################################################


    ################################################
    ##              Restrictions
    ################################################
    #get items from input and add to an array
    @restrics = Array.new
    unless params[:restrics].nil?
      params[:restrics].each do |r|
        @restrics << Restriction.find(r)
      end
    end

    #if event item is NOT in array, remove it from event
    @restaurant.restrictions.each do |r|
      unless @restrics.include? (r)
        RestaurantsRestrictions.where(restaurant_id: @restaurant, restriction_id: r).first.destroy
      end
    end

    #if item is NOT in event array, add it to event
    unless @restrics.nil?
      @restrics.each do |p|
        unless @restaurant.restrictions.exists? (p)
          @restaurant.restrictions << Restriction.find(p)
        end
      end
    end
    ################################################


    

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    ################################################
    ##              Preferences
    ################################################
    #get items from input and add to an array
    @prefs = Array.new
    unless params[:prefs].nil?
      params[:prefs].each do |p|
        @prefs << Preference.find(p)
      end
    end

    #if event item is NOT in array, remove it from event
    @restaurant.preferences.each do |p|
      unless @prefs.include? (p)
        PreferencesRestaurants.where(restaurant_id: @restaurant, preference_id: p).first.destroy
      end
    end

    #if item is NOT in event array, add it to event
    @prefs.each do |p|
      unless @restaurant.preferences.exists? (p)
        @restaurant.preferences << Preference.find(p)
      end
    end
    ################################################


    ################################################
    ##              Restrictions
    ################################################
    #get items from input and add to an array
    @restrics = Array.new
    unless params[:restrics].nil?
      params[:restrics].each do |r|
        @restrics << Restriction.find(r)
      end
    end

    #if event item is NOT in array, remove it from event
    @restaurant.restrictions.each do |r|
      unless @restrics.include? (r)
        RestaurantsRestrictions.where(restaurant_id: @restaurant, restriction_id: r).first.destroy
      end
    end

    #if item is NOT in event array, add it to event
    unless @restrics.nil?
      @restrics.each do |p|
        unless @restaurant.restrictions.exists? (p)
          @restaurant.restrictions << Restriction.find(p)
        end
      end
    end
    ################################################

    
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :zip)
    end
end
