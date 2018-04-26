class CreateClients < ActiveRecord::Migration
  create_table :clients do |t|
    t.string :name
    t.string :email
  end
end
