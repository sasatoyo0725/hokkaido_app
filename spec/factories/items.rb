FactoryBot.define do
  factory :item do
    user
    description { "RSpecでテストをかく" }
  end
end
