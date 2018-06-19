class User < ActiveRecord::Base
  has_secure_password
  has_many :training_sessions
  has_many :clients, through: :training_sessions

  validates :name, :password, :email, presence: true
  validates :name, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
  #User is login via OAuth
  #User is 100% trusted coming from Facebook
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.name = auth_hash[:info][:name]
      user.uid = auth_hash[:uid]
      user.password = SecureRandom.hex
      #Seen this User before, log User in
    end
  end
end
