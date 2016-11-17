class User < ApplicationRecord
  attr_reader :password
  has_many :comments
  has_many :posts
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true

  def authorize!(unhashed_password)
    @_bcrypt_password ||= BCrypt::Password.new(password_hash)
    @_bcrypt_password == unhashed_password
  end

  def password=(unhashed_password)
    @password = unhashed_password
    @_bcrypt_password = BCrypt::Password.create(@password)
    self.password_hash = @_bcrypt_password
  end
end
