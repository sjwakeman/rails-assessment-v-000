class CreateTrainingSessions < ActiveRecord::Migration
  create_table :trainingsessions do |t|
    t.date :date
    t.time :start_time
    t.time :end_time
    t.string :location
    t.boolean :booked_status
    t.timestamps null: false
  end
end
