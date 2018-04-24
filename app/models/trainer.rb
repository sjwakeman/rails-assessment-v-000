class Trainer < ActiveRecord::Base
  has_many :training_sessions
  has_many :users, through: :training_sessions

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :email, :bio, :encrypted_password, :uid)
  end
end
