# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Map
    can :download, MapFile

    return unless user.present?
    by_me = {user: user}

    can :manage, Rating, by_me

    return unless user.mapper?

    can :create, Map
    can :update, Map, by_me
    can :manage, MapFile, { map: by_me }
    can :manage, Screenshot, { map: by_me }

    return unless user.admin?

    can :manage, :all
  end
end
