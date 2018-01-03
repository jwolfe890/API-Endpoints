require 'faker'

FactoryBot.define do
  factory :url_content do
    content { Faker::String }
  end
end