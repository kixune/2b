class User < ApplicationRecord
  has_many :chests, dependent: :destroy
  has_many :gemstones
  has_many :gemstones, through: :chests

  before_save { email.downcase! }
  before_save { name.capitalize! }


  VALID_NAME_REGEX = /\A[a-zA-z]{2,50}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-zA-z0-9]{6,15}\z/

  validates :name,    presence: true,
                      format: { with: VALID_NAME_REGEX }
  validates :email,   presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 100 },
                      format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true,
                      format: { with: VALID_PASSWORD_REGEX }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
