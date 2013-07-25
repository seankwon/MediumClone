require 'spec_helper'

describe SessionsController do

  describe 'Login page' do
    before { visit login_path }
    it { should have_link('Submit') }
    it { should have_selector('h1', text: 'Login') }
  end

  
end
