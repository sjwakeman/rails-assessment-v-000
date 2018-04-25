class Trainer < ActiveRecord::Base
  has_many :training_sessions
  has_many :clients, through: :training_sessions

  def self.find_or_create_by_omniauth(auth_hash)
  #Trainer is login via OAuth
  #Trainer is 100% trusted coming from Facebook
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |trainer|
      trainer.name = auth_hash[:info][:name]
      trainer.uid = auth_hash[:uid]
      trainer.password = SecureRandom.hex
      #Seen this User before, log Trainer in
    end
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :email, :bio, :encrypted_password, :uid)
  end
end
