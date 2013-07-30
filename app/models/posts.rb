# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  header     :string(255)
#  content    :text
#  genre      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Posts < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :header, :content, :genre

  def editable_by?(someUser)
    someUser == user
  end
end
