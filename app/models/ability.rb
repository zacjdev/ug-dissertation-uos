class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.role == 'lecturer' || user.role == 'facilitator'
      can :manage, :all
    else
      # can only manage reports and checklistresponses
      can :manage, Report
      can :manage, ChecklistResponse
    end
  end
end
