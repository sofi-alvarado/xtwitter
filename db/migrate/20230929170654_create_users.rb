class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :bio
      t.string :location
      t.string :link
      t.string :email
      t.string :password
      t.string :lastname

      t.timestamps
    end
  end
end
