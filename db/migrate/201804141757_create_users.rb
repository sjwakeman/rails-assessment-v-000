class CreateUsers < ActiveRecord::Migration
  create_table :users do |t|
    t.string :name
    t.string :first_name
    t.string :last_name
    t.string :image
  end
end
