require 'spec_helper'


describe 'UserController' do

  describe 'Edit profile page' do
    before :each do
      User.create!(:name => 'person', :email => 'person@example.com', :password => 'foobar', :password_confirmation => 'foobar', :description => 'Lol, this is a test')
      sign_in_with 'person@example.com', 'foobar'
      click_link 'Edit Profile'
    end

    it 'should have the user\'s information' do
      page.should have_content('Edit User')
    end

    it 'should have a success message' do
      edit_fields_with('edited person', 'pesson@example2.com', 'A testing Description')
      expect_msg_with('.success_msg', 'Editing successful!')
    end

    it 'should have an error message' do
      edit_fields_with('edited person', 'wrong email', 'helllo world')
      expect_msg_with('.error_msg', 'Editing failed!')
    end

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

    def edit_fields_with(name, email, description)
      fill_in 'user[name]', with: name
      fill_in 'user[email]', with: email
      fill_in 'user[description]', with: description
      click_button 'Update User'
    end

    def expect_msg_with(css, msg)
      expect(page).to have_css css, text: msg
      expect(page).to have_css '.hide_flash'
    end

end
