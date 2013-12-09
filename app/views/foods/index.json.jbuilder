json.array!(@foods) do |food|
  json.extract! food, :id, :name, :source, :detail_source
  json.url food_url(food, format: :json)
end
