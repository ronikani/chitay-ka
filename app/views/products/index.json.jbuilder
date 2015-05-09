json.array!(@products) do |product|
  json.extract! product, :id, :title, :author_id, :category_id, :isbn, :year, :description, :filming, :quantity, :price, :sale
  json.url product_url(product, format: :json)
end

$("#products").html("<%= escape_javascript(render("products")) %>");