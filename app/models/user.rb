require 'bcrypt'

class User < ActiveRecord::Base
  has_many :favorites

  validates :first_name, :last_name, :location, :password, {presence: true}
  validates :username, :email, {uniqueness: true, presence: true}
  
  include BCrypt 

	def password
    @password ||=BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end
end

# user self joining table so bcrypt can be used by user and venues