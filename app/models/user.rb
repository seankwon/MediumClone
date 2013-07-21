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
class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of :password, :on => :create
  validates :email, presence: true, format: {with:VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
  validate :password_confirmation, presence: true
  before_create { generate_token(:auth_token) }

  def password
    @password ||= Password.new(password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end

  private 
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
end
