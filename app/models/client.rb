class Client < ActiveRecord::Base

  #has_secure_password
  #encrypted_password
  has_many :training_sessions
  has_many :users, through: :training_sessions

  validates :name, presence: { message: "Client name must be given" }#true
  validates :home_phone, length: { is: 12 }, allow_blank: true
  validates :work_phone, length: { is: 12 }, allow_blank: true
  validates :smart_phone, length: { is: 12 }, allow_blank: true

  def client_name=(name)
    self.client = Client.find_or_create_by(name: name)
  end

  def client_name
    self.client.name if self.client
  end

  def self.sorted
    Client.order(name: :asc)
  end

  #def client_attributes=(client)
    #self.client = Client.find_or_create_by(name: client_name)
    #self.client.update(client)
  #end

end
