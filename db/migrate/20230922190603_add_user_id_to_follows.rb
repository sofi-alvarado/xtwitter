class AddUserIdToFollows < ActiveRecord::Migration[7.0]
  def change
    #adding user_id to table Follows
    add_column :follows, :user_id, :integer
  end
end
