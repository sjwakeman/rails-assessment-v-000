class trainerPolicy < ApplicationPolicy

  def initialize(user, training_session)
    super(user, training_session)
    @training_session = record
  end

  def update?
    user.admin? || user.trainer? || record.try(:user) == user
  end
end
