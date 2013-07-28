require 'spec_helper'

describe 'UserController' do

  describe 'Edit profile page' do
    before :each do
      User.create!(:name => 'person', :email => 'person@example.com', :password => 'foobar', :password_confirmation => 'foobar')
      sign_in_with 'person@example.com', 'foobar'
      click_link 'Edit Profile'
    end

    it 'should have the user\'s information' do
      page.should have_content('person')
    end

    #it 'should not have password content' do
    #  page.should_not have_
    #end
  end

  private 
    def sign_in_with(email, password)
      visit login_path
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      click_button 'Submit'
    end
end
