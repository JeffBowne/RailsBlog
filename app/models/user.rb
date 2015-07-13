class User < ActiveRecord::Base
  has_secure_password
  has_one :profile
  has_many :posts
  has_many :comments
  validates :username, presence: true, uniqueness: true, on: :create
end
