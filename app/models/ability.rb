# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when "super_admin"
      can :manage, [Quiz, Question, QuestionAnswer]
    when "admin"
      can :read, :all
    when "regular"
      can :read, :all
    end
  end
end
