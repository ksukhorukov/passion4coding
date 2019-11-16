# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.sentence }
    state { time = Time.now.to_i; time.odd? ? true : false }
    vertical
  end
end
