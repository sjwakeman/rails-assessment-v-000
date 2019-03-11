class TrainingSession < ActiveRecord::Base
  #belongs_to :trainer
  belongs_to :user
  belongs_to :client

  validates :date, :client_name, :start_time, :end_time, :location, presence: { message: "must be given" }#true

  def client_name=(name)
    self.client = Client.find_or_create_by(name: name)
    #@created_client.user = current_user #TIE current_user to @created_client.user?
      #if @created_client.save
        #redirect to client_path(@created_client)
      #end
  end

  def client_name
    self.client.name if self.client
  end

  def self.request(date, start_time, end_time, location, user, client)
    @training_session = TrainingSession.create(date, start_time, end_time, location, user: user_id, client: client_id, booked_status: 1)
  end

  def client_attributes=(client)
    self.client = Client.find_or_create_by(name: client_name)
    self.client.update(client)
  end

  def self.sorted
    self.order(date: :asc, start_time: :asc)
  end

  def self.morning
    self.where("start_time<?","2000-01-01 12:00:00")
  end

  def self.evening
    self.where("start_time>?","2000-01-01 11:59:59")
  end
  
  #def booked_status
  #end

end
