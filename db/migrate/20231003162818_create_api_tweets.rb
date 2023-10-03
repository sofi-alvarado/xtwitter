class CreateApiTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :api_tweets do |t|

      t.timestamps
    end
  end
end
