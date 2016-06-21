class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_secure_password
  before_save { self.email = email.downcase } #sets email to lowercase before saving
  
  validates :username, presence: true, 
             uniqueness: { case_sensitive: false }, 
             length: { minimum: 6, maximum: 16 }
             
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # email regex string
  validates :email, presence: true, 
             uniqueness: { case_sensitive: false }, 
             length: { maximum: 105 },
             format: { with: VALID_EMAIL_REGEX }
             
  
end