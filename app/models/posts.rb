# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  header     :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  genre_id   :integer
#

class Posts < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :header, :content, :genre_id
  validates :header, length: {minimum: 10}, uniqueness: true
  validate :content, length: {minimum: 20}, uniqueness: true

  def editable_by?(someUser)
    someUser == user
  end
end
