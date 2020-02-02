class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
  validates :email, presence: true, length: {maximum: 50},
                    format: {with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :title, presence: true, length: {maximum: 20}, inclusion: {in:['SQE','Senior SQE','Intern'],message:'Must be one of "Intern", "SQE", "Senior SQE"'} 
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true 
end