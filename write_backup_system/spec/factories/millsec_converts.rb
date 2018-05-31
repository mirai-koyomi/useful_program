FactoryBot.define do
  factory :millsec_convert do
    before_date { Faker::Date.between(1.year.ago, Date.today) }
    after_date { Faker::Date.between(1.days.since, 1.year.since) }
  end
end
