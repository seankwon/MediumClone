# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  password   :string(255)
#  auth_token :string(255)
#  created_at :datetime
#  updated_at :datetime
#
require 'bcrypt'
require 'spec_helper'
describe User do
  include BCrypt
  before do
    @user = User.new(name: "example", email: "example@example.com",
                    password: hash_password("foobar"))
  end

  private
    def hash_password(password)
      password = Password.create(password)
    end
end
