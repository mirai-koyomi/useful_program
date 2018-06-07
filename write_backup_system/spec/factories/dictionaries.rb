FactoryBot.define do
  factory :dictionary do
    title { Faker::String.random(100) }
    contents { Faker::Lorem.paragraph(6) }
    trait :draft do
      status 'draft'
      publish false
    end
    trait :released do
      status 'released'
      publish true
      released_at { Faker::Date.between(1.year.ago, Date.today) }
    end
    trait :private do
      status 'released'
      publish false
      released_at { Faker::Date.between(1.year.ago, Date.today) }
    end
  end
end
