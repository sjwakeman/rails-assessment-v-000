class CreateTrainers < ActiveRecord::Migration
  create_table :trainers do |t|
    t.string :name
    t.string :first_name
    t.string :last_name
    t.string :specialty
    t.string :email
    t.string :bio
    t.timestamps null: false
  end
end
