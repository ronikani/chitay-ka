json.array!(@imagehomes) do |imagehome|
  json.extract! imagehome, :id, :title
  json.url imagehome_url(imagehome, format: :json)
end
