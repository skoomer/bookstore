class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    super()
    @user = user
    @post = post
  end

  def update?
    user.admin? or !record.published?
  end
end
