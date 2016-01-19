json.array!(@products) do |product|
  json.extract! product, :id, :name, :categoty, :date, :Price
  json.url product_url(product, format: :json)
end
