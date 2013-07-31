# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    header "MyText"
    content "MyText"
    genre_id 1
    user_id 1
  end
end
