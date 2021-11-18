# frozen_string_literal: true

# article model
class Article < ApplicationRecord
  include Visible

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy


  validates :title, presence: true
  validates :body,  length: { minimum: 5 }, presence: true

  ransacker :views do
    Arel.sql("to_char(views, '99999')")
  end
end
