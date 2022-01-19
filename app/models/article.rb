# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  status     :string           default("public")
#  views      :integer          default(1)
#
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
