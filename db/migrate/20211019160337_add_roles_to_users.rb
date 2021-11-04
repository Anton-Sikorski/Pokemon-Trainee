# frozen_string_literal: true

# roles to users: admin
class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer, default: 0
  end
end
