class TrainingSession < ActiveRecord::Base
  #belongs_to :trainer
  belongs_to :user
  belongs_to :client

  validates :date, :start_time, :end_time, presence: true

  def self.request(date, start_time, end_time, location, user, client)
    @training_session = TrainingSession.create(date, start_time, end_time, location, user: user_id, client: client_id, booked_status: 1)
  end

  def client_attributes=(client)
    self.client = Client.find_or_create_by(name: client.name)
    self.client.update(client)
  end

  def sorted
    sorted = @training_sessions.order(:date)
  end

  def client_name
    self.client.name if self.client
  end

  #def start_time
#Where 'start' is a attribute of type 'Date' accessible through Training Session's relationship
    #self.my_related_model.start
  #end

  #def end_time
#Where 'end' is a attribute of type 'Date' accessible through Training Session's relationship
    #self.my_related_model.end
  #end

  #def training_session(trainer)
    #:date
    #:start_time
    #:end_time
    #:location
  #end

  #def training_session_schedule
  #end

  #def booked_status
  #end


end
