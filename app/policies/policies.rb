class PostPolicy < ApplicationPolicy
    attr_reader :user, :post
  
    def initialize(user, post)
      @user = user
      @post = post
    end
  
    def update?
        user.admin? or not record.published?
    end
  end