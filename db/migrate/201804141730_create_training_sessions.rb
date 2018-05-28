class CreateTrainingSessions < ActiveRecord::Migration
  create_table :training_sessions do |t|
    t.date :date
    t.time :start_time
    t.time :end_time
    t.string :location
    t.boolean :booked_status
    t.integer :client_id
    t.timestamps null: false
  end
end
