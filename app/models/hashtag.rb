class Hashtag < ApplicationRecord
    has_many :taggings
    has_many :tweets, through: :taggings
    # Add presence validation for a hashtag name
    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false, message: "Hashtag already exists"}
end
