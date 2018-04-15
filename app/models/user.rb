class User < ActiveRecord::Base
  has_many :training_sessions
  belongs_to :training_sessions

end
