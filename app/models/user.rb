class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :instagrams, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
