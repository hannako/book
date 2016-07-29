require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60

  attr_accessor :password_confirmation
  attr_reader :password
  validates_confirmation_of :password
  # validates_format_of :email, as: :email_address

  def password=(new_password)
      @password = new_password
      self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest)== password
      user
    else
      nil
    end
  end
  
end
