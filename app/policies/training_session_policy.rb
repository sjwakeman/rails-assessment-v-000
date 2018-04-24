class TrainingSessionPolicy < ApplicationPolicy

  def initialize(user, training_session)
    super(user, training_session)
    @training_session = record
  end

  def update?
    user.admin? || user.trainer? || record.try(:user) == user
  end

  def permitted_attributes
       if user.admin? || user.trainer_of?(training_session) || user.user_of?(training_session)
         [:date, :start_time, :end_time, :location, :training_session_schedule]
       else
         [:training_session_schedule]
       end
     end

end
