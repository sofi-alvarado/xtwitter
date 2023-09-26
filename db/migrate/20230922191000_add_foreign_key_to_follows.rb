class AddForeignKeyToFollows < ActiveRecord::Migration[7.0]
  def change
    #Adding user_id as foreign key in table follows
    add_foreign_key :follows, :users
  end
end
