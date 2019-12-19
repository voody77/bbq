class User < ApplicationRecord
  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true, 'valid_email_2/email': true, on: [
    :create, :update, :edit
  ]
end
