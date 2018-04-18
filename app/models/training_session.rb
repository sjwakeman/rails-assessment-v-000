class TrainingSession < ActiveRecord::Base
  belongs_to :trainer
  has_many :users

  def start_time
#Where 'start' is a attribute of type 'Date' accessible through Training Session's relationship
    self.my_related_model.start
  end
end
