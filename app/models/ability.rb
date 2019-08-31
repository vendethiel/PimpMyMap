# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Map

    return unless user.present?
    can :create, Rating

    return unless user.mapper?
    can :manage, Map, user: user

    return unless user.admin?
    can :manage, :all
  end
end
