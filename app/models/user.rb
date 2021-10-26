# frozen_string_literal: true

# devise user model
class User < ApplicationRecord
  enum roles: %i[user admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :articles
  has_many :comments

  def admin?
    role == 1
  end
end
