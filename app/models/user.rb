class User < ActiveRecord::Base
  has_many: questions
  has_many: answers
  has_many: comments
  has_many: votes

  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: true
end
