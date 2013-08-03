require 'spec_helper'

describe 'PostController' do

  describe 'Create Post page' do
    before :each do 
      User.create!(:name => 'person', :email => 'person@example.com', :password => 'foobar', :password_confirmation => 'foobar', :description => 'Lol, this is a test')
      sign_in_with 'person@example.com', 'foobar'
      click_link 'Create Post'
    end

    it 'should create and save a post' do
      header = 'This is my test header for testing purposes'
      content = 'Lorem iposufeiwofjeiwofejiwofejiwoafeiowafjeiwoafeiwoafejiwoafeiwoafejiowafejiwao'
      fill_in_fields_with(header, content)
      expect_msg_with 'success_msg', 'Post creation successful!'
    end
  end

  private 
    def sign_in_with(email, password)
      visit login_path
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      click_button 'Submit'
    end

    def fill_in_fields_with(header, content)
      fill_in 'post[content]', with: content
      fill_in 'post[header]', with: header
      click_button 'Create Post'
    end

    def expect_msg_with
      expect(page).to have_css css, text: msg
      expect(page).to have_css '.hide_flash'
    end

end
