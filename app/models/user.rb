class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A\w+@\w+.\w+/, message: "must 1) start with a string, 2) then an '@', 3) then a string, 4) then a '.', and 5) end with a string." }
  validates :password, length: { in: 6..20 }
end
