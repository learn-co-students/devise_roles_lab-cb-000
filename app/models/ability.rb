# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Post
    if user.admin?
      can :manage, [User, Post]
    elsif user.vip?
      can :update, Post
    elsif user.user?
      can [:update, :destroy], Post, user_id: user.id
    end
  end
end
