class Client < ActiveRecord::Base

  #has_secure_password
  #encrypted_password

  has_many :training_sessions
  has_many :trainers, through: :training_sessions

  validates :name, presence: true

  #def name
    #"#{first_name} #{last_name}"
  #end

  private

  def client_params
    params.require(:client).permit(:name, :email)
  end

end
