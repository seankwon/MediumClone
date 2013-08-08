require 'spec_helper'
require 'controllers_helper'
include ControllerHelper

describe 'PostController' do

  describe 'Create Post page' do

    before :each do 
      person = User.create!(:name => 'person', :email => 'person@example.com', :password => 'foobar', :password_confirmation => 'foobar', :description => 'Lol, this is a test')
      sign_in_with 'person@example.com', 'foobar'
      click_link 'Create Post'
    end

    it 'should create and save a post' do
      header = 'This is my test header for testing purposes'
      content = 'Helloooooooooooofejiwoafjeiwajfoewiajfeiwajfowifewoajfiewoajfoejiowafjaiowejfwaoeifwojf'
      fill_in_fields_with header, content
      expect_msg_with '.success_msg', 'Post creation successful!'
    end

    it 'should not save post when fields aren\'t filled' do
      fill_in_fields_with '', ''
      expect_msg_with '.error_msg', 'Post failed!'
    end
  end

  describe 'Edit Post page' do
    before :each do
      person = User.create!(:name => 'person', :email => 'person@example.com', :password => 'foobar', :password_confirmation => 'foobar', :description => 'Lol, this is a test')
      newPost = Post.create!(:header => 'This is a fake header for my test', :content => 'Swear to me! Wanna see a magic trick? ahhhhh it\'s gone!!!', :genre_id => 2, :user_id => person.id)
    end

    it 'should edit a post with a success message' do
      
    end
  end

end
