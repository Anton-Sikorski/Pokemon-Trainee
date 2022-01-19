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
Fabricator(:article) do
  title { Faker::Lorem.sentence }
  body  { Faker::Lorem.paragraphs }
  created_at { Time.zone.now }
end
