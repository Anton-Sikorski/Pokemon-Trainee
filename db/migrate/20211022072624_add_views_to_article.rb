# frozen_string_literal: true

# adding views count to article
class AddViewsToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :views, :integer, default: 1
  end
end
