class CreateTrainers < ActiveRecord::Migration
  create_table :trainers do |t|
    t.string :name
    t.string :specialty
    t.string :email
    t.timestamps null: false
  end
end
