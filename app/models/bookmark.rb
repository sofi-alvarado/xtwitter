class Bookmark < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  #add association validations to your model
  validates_associated :tweet, :user
end
