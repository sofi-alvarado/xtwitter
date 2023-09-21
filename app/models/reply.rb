class Reply < ApplicationRecord
  #Associations with table tweets and users
  belongs_to :tweet
  belongs_to :user

  #Validating if content exists and if is in a length betweent 1 and 255
  validates :content, length: { within:(1...255)}, presence: true
  #Validates if the content of the reply exists
  validates :quote, presence: true
  
end
