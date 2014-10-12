json.array!(@restrictions) do |restriction|
  json.extract! restriction, :id, :name
  json.url restriction_url(restriction, format: :json)
end
