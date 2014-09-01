class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged in)
        alias_action :read, :search, :singlesearch, to: :public_actions
        if user.has_role? :admin
            can :manage, :all
        elsif user.has_role? :restricted
            can :public_actions, Review
            can [:public_actions, :create], Book, :active => true
            can [:profile], User, :id => user.id
            can [:update, :destroy, :disable], [Book, Review], :user_id => user.id
        else
            can [:public_actions, :create], Review
            can [:public_actions, :create], Book, :active => true
            can [:profile], User, :id => user.id
            can [:update, :destroy, :disable], [Book, Review], :user_id => user.id
        end 

    end
end
