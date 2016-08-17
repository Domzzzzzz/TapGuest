class Ability
  include CanCan::Ability

  # cancan abilities - only admin & a user that is a manager
  # can create, update, and delete other users
  def initialize(admin)
    admin ||= Admin.new
    alias_action :create, :read, :update, :destroy, :to => :crud
    can :crud, User
  end

  def initialize(user)
    user ||= User.new
    alias_action :create, :read, :update, :destroy, :to => :crud
    can :crud, User if user.role == "manager"
  end

end
