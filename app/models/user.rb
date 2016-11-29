class User < ActiveRecord::Base

  validates_presence_of :password_hash
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(user_login_password)
    self.password == user_login_password
  end

end