class AddFieldsInTweetsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :retweet_id, :integer
    add_column :tweets, :quoted, :boolean
    add_column :tweets, :content, :text, limit: 280, null: false
    add_column :tweets, :hashtags, :string, array: true

    #Adding foreign key to table tweets making a reference with table users
    #add_foreign_key :tweets, :users, column: :user_id
  end
end
