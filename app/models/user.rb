class User < ApplicationRecord
    #Association between users and follows
    has_many :follows_as_following, class_name: "Follow", foreign_key: "following_user_id"
    has_many :follows_as_follower, class_name: "Follow", foreign_key: "follower_user_id"
    #an user can have many tweets 
    has_many :tweets, inverse_of: :user
    #an user can have many replies
    has_many :replies
    #an user can have many bookmarks
    has_many :bookmarks
    #a user can like many tweets
    has_many :likes, inverse_of: :user
    #name will be treated as the displaying name in Twitter
    #I will take lastname as an optional value 
    validates :name, :username, :email, :username, :password, presence: true
    #Add Uniqueness validation for email and username
    #no record with the same user or email wil be created
    validates :username, :email, uniqueness: true, presence: true
    #Add Length validation of 12 characters minimum for password
    validates :password, length: { minimum: 12}, format: { with: /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])/ }
    
    #Check the followers of an user
    #if you want to list all the followings from a user
    #run rails c, create a new instance
    # u = User.followers(user_id) and then u.reload!
    scope :followers, -> (user_id) {
       joins(:follows_as_follower) #name of association
        .where(follows: { user_id: user_id })
    }

    #Check the followings of an user
    #if you want to list all the followings from a user
    #run rails c, create a new instance
    # u = User.followings(user_id) and then u.reload!
    scope :followings, -> (user_id) {
       joins(:follows_as_following) #name of association
        .where(follows: { user_id: user_id })
    }


    scope :follower_count, -> (user_id) {
        joins(:follows_as_follower) #name of association
         .where(follows: { user_id: user_id })
             .count
     }

    scope :followings_count, -> (user_id) {
       joins(:follows_as_following) #name of association
        .where(follows: { user_id: user_id })
            .count
    }
end
