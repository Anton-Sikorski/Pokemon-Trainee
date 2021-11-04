# frozen_string_literal: true

# Expanding user model with name
class AddNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
  end
end
