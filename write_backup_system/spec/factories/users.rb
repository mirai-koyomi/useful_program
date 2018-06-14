FactoryBot.define do
  factory :user do
    screen_name "MyString"
    name "MyString"
    password "my_password"
    password_confirmation "my_password"
    description "MyText"
    comment "MyText"
  end
end
