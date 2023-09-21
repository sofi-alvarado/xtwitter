class Follow < ApplicationRecord
    #name of the association, class name: where it belongs
    belongs_to :following_user, class_name: "User" , foreign_key: "following_user_id"
    belongs_to :follower_user, class_name: "User" , foreign_key: "follower_user_id"

    #Add uniqueness validation for tweet_id and user_id
    validates :follower_user_id, uniqueness { scope: :following_user_id }
    validates_associated :follower_user, :following_user
end
