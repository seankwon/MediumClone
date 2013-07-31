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

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
