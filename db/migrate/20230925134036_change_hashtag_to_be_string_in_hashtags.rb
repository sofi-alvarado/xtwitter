class ChangeHashtagToBeStringInHashtags < ActiveRecord::Migration[7.0]
  def change
    #changing tweets field to string in table hashtags
    change_column :hashtags, :tweets, :string
     #changing hashtags field to string in table tweets
    change_column :tweets, :hashtags, :string
  end
end
