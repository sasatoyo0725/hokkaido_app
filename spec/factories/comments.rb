FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    item { nil }
  end
end
