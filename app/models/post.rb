# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  header     :text
#  content    :text
#  genre_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates_presence_of :content, :header
  validates :content, uniqueness: true, length: {minimum: 30}
  validates :header, uniqueness: true, length: {minimum: 10}
end
