class CreateClients < ActiveRecord::Migration
  create_table :clients do |t|
    t.string :name
    t.string :email
    t.string :home_address
    t.string :work_address
    t.string :home_phone
    t.string :work_phone
    t.string :smart_phone
    t.integer :user_id
  end
end
