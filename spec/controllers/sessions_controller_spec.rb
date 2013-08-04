require 'spec_helper'

describe 'SessionsController' do
  before :each do
    User.create!(:name => 'person', :email => 'person@example.com', :password => 'foobar', :password_confirmation => 'foobar', :description => 'This is a test description')
  end

  describe 'Login page' do
    it 'should have content' do
      visit login_path
      page.should have_selector('h1', 'Login')
      page.should have_css('input.user-input')
    end
  end

  describe 'the signin process' do
    it 'should show a login success message with an x' do
      sign_in_with 'person@example.com', 'foobar'
      user_sees_notice 'Successful login!'
    end

    it 'should flash an error message when wrong password' do
      sign_in_with 'person@example.com', 'wrong'
      user_sees_error 'Sorry, wrong credentials!'
    end

    it 'should flash error message when non-existant email' do
      sign_in_with 'wrong@person.com', 'foobar'
      user_sees_error 'Sorry, wrong credentials!'
    end
  end

  describe 'user is already signed in' do

    it 'should redirect to profile page if user is already logged in' do
      sign_in_with 'person@example.com', 'foobar'
      user_sees_notice 'Successful login!'
      visit root_path
      click_link 'Profile'
      expect(page).to have_content 'person'
    end

  end

  private
    def sign_in_with(email, password)
      visit login_path
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      click_button 'Submit'
    end

    def user_sees_notice(text)
      expect(page).to have_css '.success_msg', text: text
      expect(page).to have_css '.hide_flash'
    end

    def user_sees_error(text)
      expect(page).to have_css '.error_msg', text: text
    end
end
