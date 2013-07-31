# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  genre_name :text
#  created_at :datetime
#  updated_at :datetime
#

class Genre < ActiveRecord::Base
  validates_presence_of :id, :genre_name
end
