class Follow < ApplicationRecord
    #name of the association, class name: where it belongs
    belongs_to :following_user, class_name: "User" , foreign_key: "following_user_id"
    belongs_to :follower_user, class_name: "User" , foreign_key: "follower_user_id"


    validates :follower_user_id, uniqueness:  { scope: :following_user_id }
    validate :cannot_follow_itself

    def cannot_follow_itself
        #check first if the following user is not the same as the user_id
        #then if the follower user is not the same as the user_id
        if following_user_id == user_id ||follower_user_id == user_id
            errors.add(:base, "you cannot follow yourself and you can't be your own follower")
        end

    end
end
