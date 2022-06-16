# frozen_string_literal: true

FactoryBot.define do
  factory :recipe, class: 'Recipe' do
    title { Faker::Food.dish }
    content { Faker::Food.description }
  end
end
