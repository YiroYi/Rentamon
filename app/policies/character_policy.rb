class CharacterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user)
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    owner?
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    owner?
  end

  def owner?
    record.user == user
  end
  
end
