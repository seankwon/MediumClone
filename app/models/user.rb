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
class User < ActiveRecord::Base
  has_many :posts
  validates_presence_of :password, :password_confirmation, :on => :create

  attr_accessor :password, :password_confirmation
  before_save :encrypt_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
  before_create {generate_token(:auth_token)}

  def self.authenticate(options={})
    user = find_by email: options[:email]
    if user && user.password_hash == BCrypt::Engine.hash_secret(options[:password], user.password_salt)
      user
    else
      nil
    end
  end

  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
