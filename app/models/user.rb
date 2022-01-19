# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer          default("user")
#
# devise user model
class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :default_avatar, on: %i[create edit]
  validates :name, :role, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_one_attached :avatar
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  private

    def default_avatar
      return if avatar.attached?

      avatar.attach(io: File.open("user-images/user-default.jpeg"),
                    filename: "file.pdf")
    end
end
