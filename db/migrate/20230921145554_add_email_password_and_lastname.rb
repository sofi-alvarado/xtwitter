class AddEmailPasswordAndLastname < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :email, :string
    add_column :tweets, :password, :string
    add_column :tweets, :lastname, :string
  end
end
