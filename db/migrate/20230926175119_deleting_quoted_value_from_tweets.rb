class DeletingQuotedValueFromTweets < ActiveRecord::Migration[7.0]
  def change
    #Removing quoted from table tweets
    remove_column :tweets, :quoted
    #Adding quote_id and quote columns to table tweets
    add_column :tweets, :quote_id, :integer
    add_column :tweets, :quote, :string
  end
end
