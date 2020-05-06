# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when "super_admin"
      can :manage, [Quiz, Question, QuestionAnswer]
    when "admin"
      can :read, [Quiz, Question, QuestionAnswer]
      can :update, [Question, QuestionAnswer]
    when "regular"
      can :read, [Quiz, Question, QuestionAnswer]
    when "minimal"
      can :read, [Quiz, Question]
    end
  end
end
