class User < ApplicationRecord
  has_many :auctions, dependent: :nullify
  has_many :bids, dependent: :nullify

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: { message: 'username already taken' }
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
end
