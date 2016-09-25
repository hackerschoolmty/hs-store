json.extract! order, :id, :total, :code, :created_at, :updated_at
json.url order_url(order, format: :json)