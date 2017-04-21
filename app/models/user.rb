require 'bcrypt'

class User < ActiveRecord::Base
  has_many :favorite

  # before_save :check_input_password

  validates :username, :first_name, :last_name, :location, :email, :password, {presence: true}
  validates :username, {uniqueness: true}
  

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

  # def check_input_password
  #   return false if @input_password == ""
  # end
end
