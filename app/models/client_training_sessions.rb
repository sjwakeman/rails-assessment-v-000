class ClientTrainingSessions < ActiveRecord::Base

    belongs_to :client
    belongs_to :training_session

end
