# frozen_string_literal: true

# statuses to article: public, archived, private
class AddStatusToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :status, :string, default: 'public'
  end
end
