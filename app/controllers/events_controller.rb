class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @restaurants = Restaurant.all
    @users = User.all.where.not(id: current_user)

    @buttonName = "Create Event"
  end

  # GET /events/1/edit
  def edit
    @users = User.all.where.not(id: current_user)
    @buttonName = "Update Event"
  end


  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.host_id = current_user.id


    respond_to do |format|
      if @event.save

        @event.users << User.find(@event.host_id)
        unless params[:users].nil?
          params[:users].each do |u|
            @event.users << User.find(u)
        end
      end

        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        @users = User.all
      end
    end
  end


  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update


    ################################################
    ##              Preferences
    ################################################
    # get items from input and add to an array
    @users = Array.new
    unless params[:users].nil?
      params[:users].each do |u|
        @users << User.find(u)
      end
    end

    # remove univited users
    @event.users.each do |u|
      unless @users.include? (u)
        EventsUsers.where(event_id: @event, user_id: u).first.destroy
      end
    end

    # add new users
    @users << User.find(@event.host_id) # ensure host is always a user
    @users.each do |u|
      unless @event.users.exists? (u)
        @event.users << User.find(u)
      end
    end
    ################################################

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.users.destroy

    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :zip, :restaurant_id, :date)
    end
end
