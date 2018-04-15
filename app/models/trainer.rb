class Trainer < ActiveRecord::Base
  has_many :training_sessions
  has_many :users, through: :training_sessions

end
