class YelpSearchesController < ApplicationController
  include Yelp::V2::Search::Request

  before_action :set_yelp_search, only: [:show, :edit, :update, :destroy]

  # GET /yelp_searches
  # GET /yelp_searches.json
  def index
    @yelp_searches = YelpSearch.all
  end

  # GET /yelp_searches/1
  # GET /yelp_searches/1.json
  def show

    @client = Yelp::Client.new

    @request = Location.new(
      :term => @yelp_search.term,
      :city => "San Francisco",
      :limit => @yelp_search.limit,
      :offset => @yelp_search.offset,
      :sort => @yelp_search.sort,
      :category_filter => @yelp_search.category_filter,
      :radius_filter => @yelp_search.radius_filter,
      :deals_filter => @yelp_search.deals_filter
    )

    @response = @client.search(@request)
    @businesses = @response.to_h["businesses"]
    

  end

  # GET /yelp_searches/new
  def new
    @yelp_search = YelpSearch.new
  end

  # GET /yelp_searches/1/edit
  def edit
  end

  # POST /yelp_searches
  # POST /yelp_searches.json
  def create
    @yelp_search = YelpSearch.new(yelp_search_params)

    respond_to do |format|
      if @yelp_search.save
        format.html { redirect_to @yelp_search, notice: 'Yelp search was successfully created.' }
        format.json { render :show, status: :created, location: @yelp_search }
      else
        format.html { render :new }
        format.json { render json: @yelp_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yelp_searches/1
  # PATCH/PUT /yelp_searches/1.json
  def update
    respond_to do |format|
      if @yelp_search.update(yelp_search_params)
        format.html { redirect_to @yelp_search, notice: 'Yelp search was successfully updated.' }
        format.json { render :show, status: :ok, location: @yelp_search }
      else
        format.html { render :edit }
        format.json { render json: @yelp_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yelp_searches/1
  # DELETE /yelp_searches/1.json
  def destroy
    @yelp_search.destroy
    respond_to do |format|
      format.html { redirect_to yelp_searches_url, notice: 'Yelp search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yelp_search
      @yelp_search = YelpSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yelp_search_params
      params.require(:yelp_search).permit(:term, :limit, :offset, :sort, :category_filter, :radius_filter, :deals_filter)
    end
end
