# frozen_string_literal: true

# devise user model
class User < ApplicationRecord
  enum roles: { user: 0, admin: 1 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :role, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_one_attached :avatar
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  def admin?
    role == 1
  end

  def default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open("storage/user-images/user-default.jpeg"),
                  filename: "file.pdf")
  end
end
