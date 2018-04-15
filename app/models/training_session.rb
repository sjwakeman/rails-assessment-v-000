class TrainingSession < ActiveRecord::Base
  belongs_to :trainer
  has_many :users

end
