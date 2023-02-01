class User < ApplicationRecord

  has_secure_password
  validates :password, length: { minimum: 5 }
 
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :downcase_fields
  before_save :strip_fields
  def downcase_fields
    self.email.downcase
  end
  def strip_fields
    self.email.strip
    self.first_name.strip
    self.last_name.strip
  end
  def authenticate_with_credentials(email, password) 
    user = User.where(email: email.downcase.strip).first 
    if user
      user.authenticate(password)
    end
  end

end
