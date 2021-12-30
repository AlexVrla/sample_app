class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, uniqueness: true, presence: true,
            length: {maximum: 255},
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  has_secure_password
  validates :password, presence: true, allow_blank: false, length: {minimum: 6}
end
