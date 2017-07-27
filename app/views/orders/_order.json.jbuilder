json.extract! order, :id, :first_name, :second_name, :email, :created_at, :updated_at
json.url order_url(order, format: :json)
