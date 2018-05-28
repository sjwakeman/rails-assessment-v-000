class Client < ActiveRecord::Base

  #has_secure_password
  #encrypted_password

  belongs_to :training_session
  #has_many :trainers, through: :training_sessions
  has_many :users, through: :training_sessions

  validates :name, presence: true

  def client_name
    "#{first_name} #{last_name}"
  end

  private

  def client_params
    params.require(:client).permit(:name, :email)
  end

end
