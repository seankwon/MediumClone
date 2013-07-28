require 'spec_helper'

describe 'UserController' do

  describe 'Edit profile page' do
    before :each do
      User.create!(:name => 'person', :email => 'person@example.com', :password => 'foobar', :password_confirmation => 'foobar')
      sign_in_with 'person@example.com', 'foobar'
      click_link 'Edit Profile'
    end

    it 'should have the user\'s information' do
      page.should have_content('Edit User')
    end

    #it 'should not have password content' do
    #  page.should_not have_
    #end
  end

  describe 'Sign Up page' do
    it 'should create a user' do
      visit signup_path
      fill_in 'user[name]', with: 'person'
      fill_in 'user[email]', with: 'person@yahoo.com'
      fill_in 'user[description]', with: 'Hello world'
      fill_in 'user[password]', with: 'foobar'
      fill_in 'user[password_confirmation]', with: 'foobar'
      click_button 'Create User'
      expect(page).to have_css '.success_msg', text: 'Creation successful!'
      expect(page).to have_css '.hide_flash'
    end
  end

  private 
    def sign_in_with(email, password)
      visit login_path
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      click_button 'Submit'
    end

end
