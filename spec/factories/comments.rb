FactoryBot.define do
  factory :comment do
    user
    item
    content {"RSpecでテストをかく"}
  end
end
