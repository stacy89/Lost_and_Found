require 'bcrypt'
require 'paperclip'

class User < ActiveRecord::Base
  include Paperclip::Glue
  has_many :favorite

  validates :first_name, :last_name, :location, :password, {presence: true}
  validates :username, :email, {uniqueness: true, presence: true}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
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