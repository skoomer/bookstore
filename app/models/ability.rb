# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_a? Admin
      can :manage, :all
    elsif user.is_a?(User) && user.persisted?
      can :read, [Author, Book, Category, Coupon, Review]
      can :create, Review, user_id: user.id
      can %i[read create update], [Address], user_id: user.id
      can :create, Order
      can :manage, User, user_id: user.id
    else
      can :read, [Author, Book, Category, Review]
      can :create, Order
    end
  end
end
