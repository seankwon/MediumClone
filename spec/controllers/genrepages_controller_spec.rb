require 'spec_helper'

describe 'GenrepagesController' do

  describe 'Home Page' do
    it 'should have the h1 "Medium platform"' do
      visit root_path
      expect(page).to have_content('Medium platform')
    end
  end

end
