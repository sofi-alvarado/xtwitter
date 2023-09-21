class RemoveColumnsFromTweets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :email, :string
    remove_column :tweets, :password, :string
    remove_column :tweets, :lastname, :string
  end
end
