FactoryBot.define do
  factory :millsec_convert do
    before_time { Faker::Date.between(1.year.since, Date.today) }
    after_time { Faker::Date.between(1.days.ago, 1.year.ago) }
  end
end
