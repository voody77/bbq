class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :events
  has_many :comments
  has_many :subscriptions

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true, 'valid_email_2/email': true, on: [
    :create, :update, :edit
  ]

  validates_presence_of :avatar, on: [:edit]

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  # Задаем юзеру случайное имя, если оно пустое
  def set_name
    self.name = "Товарисч №#{rand(7777)}" if self.name.blank?
  end
end