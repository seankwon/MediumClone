require 'spec_helper'

describe 'SessionsController' do
  before :each do
    User.create!(:name => 'person', :email => 'person@example.com', :password => 'foobar', :password_confirmation => 'foobar')
  end

  describe 'Login page' do
    #A spec test for seeing if it works, lol.
    it 'should have content' do
      visit login_path
      page.should have_selector('h1', 'Login')
      page.should have_css('input.user-input')
    end
  end

  describe 'the signin process', :type => :feature do
    it 'should show a login success message' do
      sign_in_with 'person@example.com', 'foobar'
      user_sees_notice 'You have successfully signed in!'
    end

    it 'should flash an error message when wrong password' do
      sign_in_with 'person@example.com', 'wrong'
      user_sees_error 'Sorry, wrong credentials!'
    end

    it 'should flash error message when non-existant email' do
      sign_in_with 'wrong@person.is', 'foobar'
      user_sees_error 'Sorry, wrong credentials!'
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
      expect(page).to have_css '.flash.notice', text: text
    end

    def user_sees_error(text)
      expect(page).to have_css '.flash.alert', text: text
    end
end
