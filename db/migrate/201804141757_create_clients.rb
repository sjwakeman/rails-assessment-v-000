class CreateClients < ActiveRecord::Migration
  create_table :clients do |t|
    t.string :name
    t.string :email
    t.string :home_address
    t.string :work_address
    t.integer :home_phone
    t.integer :work_phone
  end
end
