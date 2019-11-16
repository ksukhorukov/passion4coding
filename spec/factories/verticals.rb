# frozen_string_literal: true

FactoryBot.define do
  factory :vertical do
    name { FFaker::Lorem.sentence }
  end
end
