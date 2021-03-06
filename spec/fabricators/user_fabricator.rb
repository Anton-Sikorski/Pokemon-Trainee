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
Fabricator(:user) do
  name       { Faker::Name.name }
  email      { Faker::Internet.email }
  password   { Faker::Internet.password(min_length: 6) }
  created_at { 5.days.ago }
end
