json.array!(@starships) do |starship|
  json.extract! starship, :id, :name
  json.url starship_url(starship, format: :json)
end
