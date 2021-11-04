# frozen_string_literal: true

# statuses to comments: public, archived, private
class AddStatusToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :status, :string, default: 'public'
  end
end
