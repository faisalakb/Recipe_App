class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Recipe, user_id: user.id

    return unless user.present?

    can :manage, Recipe, user_id: user.id

    can :read, Recipe, public: true
  end
end
