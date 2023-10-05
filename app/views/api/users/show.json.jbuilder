json.partial! "api/users/user", user: @user
#json.user do {
    #json.extract! user, :id, :name, :username, :bio, :location, :link, :email, :password, :lastname, :created_at, :updated_at
    #json.followers @followers_count
    #json.following @followers_count
#}