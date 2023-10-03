json.extract! user, :id, :name, :username, :bio, :location, :link, :email, :password, :lastname, :created_at, :updated_at
json.url api_user_url(user, format: :json)