json.array!(@authors) do |author|
  json.extract! author, :id, :full_name, :bith_day, :biography
  json.url author_url(author, format: :json)
end
