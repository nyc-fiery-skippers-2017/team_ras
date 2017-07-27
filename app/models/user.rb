class User < ActiveRecord::Base
  has_many :questions, :foreign_key => :creator
  has_many :answers, :foreign_key => :responder
  has_many :comments, :foreign_key => :commenter
  has_many :votes, :foreign_key => :voter

  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: true
end
