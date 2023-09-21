class Reply < ApplicationRecord
  #Associations with table tweets and users
  belongs_to :tweet
  belongs_to :user
  #add association validations to your model
  validates_associated :user, :tweet
  #Validating if content exists and if is in a length betweent 1 and 255
   #If content is not provided throw message: is too short (minimum is 1 character)", "Please enter your text"
  validates :quote, length: { within:(1...255)}, presence: { message: "Please enter your text" }
end
