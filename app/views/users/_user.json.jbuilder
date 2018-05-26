json.extract! user, :id, :username, :name, :last_name, :phone, :address, :email, :password, :last_access, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
