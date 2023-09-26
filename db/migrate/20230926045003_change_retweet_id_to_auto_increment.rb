class ChangeRetweetIdToAutoIncrement < ActiveRecord::Migration[7.0]
  def change
    # Removing retweet_id
    remove_column :tweets, :retweet_id
    # Adding retweet_id as an autoincrement
    add_column :tweets, :retweet_id, :integer, autoincrement: true
  end
end
