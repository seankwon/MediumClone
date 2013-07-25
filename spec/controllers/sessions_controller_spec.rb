require 'spec_helper'

describe 'SessionsController' do

  describe 'Login page' do

    it 'should do something cool' do
      visit login_path
      expect(page).to have_selector('h1', text: 'Login')
    end

  end

  
end
