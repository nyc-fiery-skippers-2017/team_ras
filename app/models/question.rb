class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  belongs_to :creator, :class_name => 'User'

  validates :title, :body, :presence => true 
end
