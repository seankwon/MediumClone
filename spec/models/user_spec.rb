# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  name          :string(255)
#  auth_token    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  password_hash :text
#  password_salt :text
#  description   :text
#

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  password   :string(255)
#  auth_token :string(255)
#  created_at :datetime
#  updated_at :datetime
#
require 'spec_helper'
describe User do
  it 'should authenticate a user with a matching password and email' do
    user = FactoryGirl.create(:user, :name => 'franz', :description => 'I am franz and I like to test Seans software', :email => 'franz@test.com', :password => 'foobar', :password_confirmation => 'foobar')
    params = {email: 'franz@test.com', password: 'foobar'}
    User.authenticate(params).should == user
  end

  it 'should not authenticate a user with incorrect credentials' do

  end
end
