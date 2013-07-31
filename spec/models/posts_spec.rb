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

require 'spec_helper'

describe Posts do
end
