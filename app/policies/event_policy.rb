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
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  def subscribe?
    !(record.subscribers.include?(user) || user_is_owner?)
  end


  private

  def user_is_owner?
    user.present? && (record.try(:user) == user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end