# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "example@example.com"
    name "example"
    password "foobar"
    password_confirmation "foobar"
    #auth_token
  end
end
