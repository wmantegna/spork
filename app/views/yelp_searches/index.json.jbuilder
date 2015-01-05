json.array!(@yelp_searches) do |yelp_search|
  json.extract! yelp_search, :id, :term, :limit, :offset, :sort, :category_filter, :radius_filter, :deals_filter
  json.url yelp_search_url(yelp_search, format: :json)
end
