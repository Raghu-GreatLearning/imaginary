FactoryBot.define do
  factory :book do
    title { Faker::Name.name}
    year_published { Faker::Number.within(range: 1800..2020) }
    price { "9.99" }
    out_of_print {true}
    views { Faker::Number.between(from: 100, to: 1000) }
    association :author
    association :supplier
  end
end
