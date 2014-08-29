class Ability
  include CanCan::Ability

  def initialize(user)
       user ||= User.new # guest user (not logged in)
       can :read, :all, :active => true
       can [:update, :destroy, :deactivate] 
    
  end
end
