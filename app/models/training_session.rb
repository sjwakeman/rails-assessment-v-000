class TrainingSession < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :user

  validates :trainer_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def start_time
#Where 'start' is a attribute of type 'Date' accessible through Training Session's relationship
    self.my_related_model.start
  end

  def end_time
#Where 'end' is a attribute of type 'Date' accessible through Training Session's relationship
    self.my_related_model.end
  end

  def training_session(trainer)
    :date
    :start_time
    :end_time
    :location
  end

  def training_session_schedule
  end

  def booked_status
  end
end
