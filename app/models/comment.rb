# frozen_string_literal: true

# comment model
class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  belongs_to :user

  validates :body, presence: true, length: { minimum: 1 }
end
