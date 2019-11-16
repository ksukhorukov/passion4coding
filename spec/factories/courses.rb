# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { FFaker::Lorem.sentence }
    author { "#{FFaker::Name.first_name} #{FFaker::Name.last_name}" }
    state { time = Time.now.to_i; time.odd? ? true : false }
    category
  end
end
