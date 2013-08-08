require 'spec_helper'
require 'controllers_helper'
include ControllerHelper

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
      expect_msg_with '.success_msg' ,'Successful login!'
    end

    it 'should flash an error message when wrong password' do
      sign_in_with 'person@example.com', 'wrong'
      expect_msg_with '.error_msg' ,'Sorry, wrong credentials!'
    end

    it 'should flash error message when non-existant email' do
      sign_in_with 'wrong@person.com', 'foobar'
      expect_msg_with '.error_msg' ,'Sorry, wrong credentials!'
    end
  end

  describe 'user is already signed in' do

    it 'should redirect to profile page if user is already logged in' do
      sign_in_with 'person@example.com', 'foobar'
      expect_msg_with '.success_msg', 'Successful login!'
      visit root_path
      click_link 'Profile'
      expect(page).to have_content 'person'
    end

  end

end
