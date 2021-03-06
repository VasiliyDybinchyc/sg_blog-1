class User < ActiveRecord::Base

  attr_accessor :remember_token

  before_save { self.email = email.downcase }

  validates_presence_of :name, :email, :password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :length => { maximum: 30 }

  validates :email, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, length: { minimum: 6 }

  has_one :geolocation, dependent: :destroy

  class << self

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end
