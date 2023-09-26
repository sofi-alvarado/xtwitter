class AddingForeignKeysToFollows < ActiveRecord::Migration[7.0]
  def change
    #Adding new columns for following and follower
    add_column :follows, :following_user_id, :integer
    add_column :follows, :follower_user_id, :integer
    #Adding foreign keys to table follows making a reference with table users
    add_foreign_key :follows, :users, column: :following_user_id
    add_foreign_key :follows, :users, column: :follower_user_id
  end
end
