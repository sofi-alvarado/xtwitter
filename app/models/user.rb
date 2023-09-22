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
    
    #validates :legacy_code, format: {with: /regex/}

end
