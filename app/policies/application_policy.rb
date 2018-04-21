class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, training_session)
    super(user, training_session)
    @training_session = record
  end
  
  #def initialize(user, record)
    #@user = user
    #@record = record
  #end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
    #user.admin? || user.trainer? || record.try(:user) == user
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
