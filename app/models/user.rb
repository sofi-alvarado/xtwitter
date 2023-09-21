class User < ApplicationRecord
    #Association between users and follows
    has_many :follows_as_following, class_name: "Follow", foreign_key: "following_user_id"
    has_many :follows_as_follower, class_name: "Follow", foreign_key: "follower_user_id"
    #an user can have many tweets 
    has_many :tweets
    #an user can have many replies
    has_many :replies
    #an user can have many bookmarks
    has_many :bookmarks
    #a like belongs to an unique user
    has_one :likes

    #name will be treated as the displaying name in Twitter
    #I will take lastname as an optional value
    validates :name, :username, :email, :username, :password, presence: true
end
