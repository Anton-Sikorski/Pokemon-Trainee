# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer          default("user")
#
require "rails_helper"

RSpec.describe User, type: :model do
  user = Fabricate(:user)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without name" do
      user.name = nil
      expect(user).not_to be_valid
    end

    it "is not valid without role" do
      user.role = nil
      expect(user).not_to be_valid
    end

    it "is with has invalid email" do
      user.email = "anton"
      expect(user).not_to be_valid
    end

    it "is is not valid without password" do
      user.password = nil
      expect(user).not_to be_valid
    end
  end
end
