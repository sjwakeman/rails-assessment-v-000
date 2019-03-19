class Client < ActiveRecord::Base

  #has_secure_password
  #encrypted_password
  belongs_to :user
  has_many :training_sessions, dependent: :destroy
  has_many :users, through: :training_sessions

  validates :name, presence: { message: "must be given" }#true
  validates :home_phone, :work_phone, :smart_phone, length: { is: 12, message: "format XXX-XXX-XXXX"}, allow_blank: true

  def client_name=(name)
    self.client = Client.find_or_create_by(name: name)
  end

  def client_name
    self.client.name if self.client
  end

  def self.sorted
    Client.order(name: :asc)
  end

  def self.search(search)
      where(["name LIKE ?","%#{search}%"])#undefined method `each' for nil:NilClass line32
  end
end
