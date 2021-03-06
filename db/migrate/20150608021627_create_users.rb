class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :state
      t.integer :district_id
      t.string :encrypted_password
      t.string :salt

      t.timestamps null: false
    end
  end
end
