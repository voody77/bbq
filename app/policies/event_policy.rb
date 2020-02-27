class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    update?
  end

  def update?
    user_is_owner?(record)
  end

  def subscribe?
    user.present? && !user_is_owner?(record)
  end


  private

  def user_is_owner?(event)
    user.present? && (event.try(:user) == user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end