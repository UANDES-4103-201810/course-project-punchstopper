json.extract! user_wishlist, :id, :user_id, :project_id, :created_at, :updated_at
json.url user_wishlist_url(user_wishlist, format: :json)
