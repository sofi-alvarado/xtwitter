class AddTweetsArraytAtHashtags < ActiveRecord::Migration[7.0]
  def change
    add_column :hashtags, :tweets, :string, array: true
  end
end
