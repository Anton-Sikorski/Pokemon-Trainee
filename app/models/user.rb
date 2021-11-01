# frozen_string_literal: true

# devise user model
class User < ApplicationRecord
  enum roles: %i[user admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :role
  validates :email, format: { with: /[a-z_.]+@[a-z_.-]+\.[a-z]+/ }
  has_one_attached :avatar
  has_many :articles
  has_many :comments

  def admin?
    role == 1
  end

  def default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open("storage/user-images/user-default.jpeg"),
                  filename: "file.pdf")
  end
end
