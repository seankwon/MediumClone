require 'spec_helper'

describe 'GenrepagesController' do

  describe 'Home Page' do

    it 'should have the h1 "Medium platform"' do
      visit root_path
      page.should have_content('Medium platform')
    end

    it 'should have a link redirecting to sign in' do
      visit root_path
      page.should have_link('Sign in!')
    end

  end

end
