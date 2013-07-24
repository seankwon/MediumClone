# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post, :class => 'Posts' do
    header "MyString"
    content "MyText"
    genre "MyString"
    user_id ""
  end
end
