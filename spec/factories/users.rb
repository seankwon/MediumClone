# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.sequence(:name) {|n| "foo#{n}"}
    u.sequence(:email) {|n| "foo#{n}@bar.com"}
    u.description 'I am foobar and I like to fooooo'
    u.password 'foobar'
    u.password_confirmation { |u| u.password }
  end
end
