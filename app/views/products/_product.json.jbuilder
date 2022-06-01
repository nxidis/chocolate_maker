json.extract! product, :id, :product_name, :product_type, :shelf_life, :sku, :net_weight, :shipping_weight, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
