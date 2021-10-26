# frozen_string_literal: true

# authorization of the articles
class AddUserIdToArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :user, null: false, foreign_key: true
  end
end
