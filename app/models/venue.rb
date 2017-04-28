require 'bcrypt'
require 'paperclip'

class Venue < ActiveRecord::Base
	include Paperclip::Glue
  has_many :favorite

	validates :username, :email, {presence: true, uniqueness: true}
	validates :location, :password, {presence: true}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/:style/missing.png"
  validates_attachment_content_type :image, content_type: ["image/jpeg", "image/gif", "image/png"] 

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

# is it possible or even good practice to create a partial for bcrypt?