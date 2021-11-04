# frozen_string_literal: true

# article model
class Article < ApplicationRecord
  include Visible

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :body, length: { minimum: 5 }
end
