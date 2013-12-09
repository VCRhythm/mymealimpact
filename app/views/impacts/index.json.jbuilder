json.array!(@impacts) do |impact|
  json.extract! impact, :id, :detail, :food_id, :source_code, :destination_code
  json.url impact_url(impact, format: :json)
end
