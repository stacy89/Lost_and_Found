require 'bcrypt'
class Venue < ActiveRecord::Base
	has_many :favorite

	validates :username, :email, {presence: true, uniqueness: true}
	validates :first_name, :last_name, :name, :location, :password, {presence: true}

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
