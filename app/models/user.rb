class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
	
  has_secure_password validations: false

  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 20 }
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
end