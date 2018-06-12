class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role?
        can :manage, :all
    else
        #User manages project.
        can :manage, Project, user_id: user.id
        can :create_promise, Project, user_id: user.id
        #Users that didn't create the project can fund.
        can :fund_project, Project
        cannot :fund_project, Project, user_id: user.id
        #Users can't make outstanding.
        cannot :make_project_outstanding, Project
        #Users can edit their own profile.
        can :manage, User, id: user.id
        #Users can't manage categories.
        cannot :manage, Category
        can :read, :all
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
