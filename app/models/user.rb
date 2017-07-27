class User < ActiveRecord::Base
  has_many :questions, :foreign_key => :creator_id
  has_many :answers, :foreign_key => :responder_id
  has_many :comments, :foreign_key => :commenter_id
  has_many :votes, :foreign_key => :voter_id

  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: true
end
