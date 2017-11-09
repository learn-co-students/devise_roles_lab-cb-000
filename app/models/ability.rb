class Ability
  include CanCan::Ability 

  def initialize(user)

    user ||= User.new

      can :read, Post
      can :create, Post

    if user.admin?
      can :manage, Post
      can :manage, User
    end

    if user.vip?
      can :crud, Post, :user_id => user.id
      can :update, Post
      cannot :delete, User
      can :read, User, :id => user.id
    end

    if user.user?
      can :crud, Post, :user_id => user.id
      can :read, User, :id => user.id
    end

  end
end
