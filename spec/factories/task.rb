# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::BossaNova.song }
  end
end
