class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, 'valid_email_2/email': true, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end


  private

  def email_used?
    errors.add(:user_email, I18n.t('errors.messages.subscription.email_used')) if User.where(email: user_email).present?
  end

  def can_subscribe?
    errors.add(:user, I18n.t('errors.messages.subscription.cant_subs')) if event.user == user
  end
end