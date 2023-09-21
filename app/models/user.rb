class User < ApplicationRecord
    #Association between users and follows
    has_many :follows_as_following, class_name: "Follow", foreign_key: "following_user_id"
    has_many :follows_as_follower, class_name: "Follow", foreign_key: "follower_user_id"
    #a user has many tweets association
    has_many :tweets
end
