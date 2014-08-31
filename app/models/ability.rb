class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged in)
        alias_action :read, :create, :search, :singlesearch, to: :public_actions
        if user.has_role? :admin
            can :manage, :all
        else
            can :public_actions, Review
            can :public_actions, Book, :active => true
            can [:update, :destroy, :disable], [Book, Review], :user_id => user.id
        end 

    end
end
