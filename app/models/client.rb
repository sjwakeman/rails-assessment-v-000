class Client < ActiveRecord::Base

  #has_secure_password
  #encrypted_password
  has_many :training_sessions
  has_many :users, through: :training_sessions

  validates :name, presence: true

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

  private

  def client_params
    params.require(:client).permit(:name, :email, :home_address, :home_phone, :work_address, :work_phone, :smart_phone)
  end

end
