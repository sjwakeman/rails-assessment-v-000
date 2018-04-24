class TrainingSession < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :users

  validates :user_id, presence: true
  validates :trainer_id, presence: true

  def start_time
#Where 'start' is a attribute of type 'Date' accessible through Training Session's relationship
    self.my_related_model.start
  end

  def end_time
#Where 'end' is a attribute of type 'Date' accessible through Training Session's relationship
    self.my_related_model.end
  end

  def training_session
  end

  def training_session_schedule
  end
end
