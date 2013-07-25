require 'spec_helper'

describe 'SessionsController' do

  describe 'Login page' do

    it 'should have content' do
      visit login_path
      page.should have_selector('h1', 'Login')
      page.should have_css('input.user-input')
    end

    it 'should be able to fill in two text-fields' do
      visit login_path
      fill_in "email", :with => 'example'
      fill_in "password", :with => 'foobar'
      click_button "Submit"
    end

  end
  
end
