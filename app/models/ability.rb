class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    else
      can :manage, Post, author_id: user.id
      can :read,   Post, private_post: false
      can :update, User, id: user.id
      # Task 11
      # Removed because only admins should access the audit log
      # can :read, :audit_log
    end
  end
end
