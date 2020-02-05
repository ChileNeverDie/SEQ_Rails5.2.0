class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :problems, dependent: :destroy
  
  before_save { email.downcase! }
  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
  validates :email, presence: true, length: {maximum: 50},
                    format: {with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :title, presence: true, length: {maximum: 20}, inclusion: {in:['SQE','Senior SQE','Intern'],message:'Must be one of "Intern", "SQE", "Senior SQE"'} 
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true 

  class << self
  # 返回指定字符串的哈希摘要
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    # 返回一个随机令牌
    def new_token
      SecureRandom.urlsafe_base64
    end
    
    # 为了持久保存会话，在数据库中记住用户
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    # 如果指定的令牌和摘要匹配，返回 true
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
  end
      
  # 忘记用户
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  # 实现动态流原型
  def feed
    Problem.where("user_id = ?", id)
  end

end