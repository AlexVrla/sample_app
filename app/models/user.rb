class User < ApplicationRecord
validates :name, presence: true, length: {maximum: 50}
validates :email, presence: true, length: {maximum: 255}, format: { with: /.+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-.]+/i }
end
