class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  belongs_to :creator, :class_name => 'User'

  validates :title, :body, :presence => true

  def up_points
    self.votes.where(value: 1).length
  end

  def down_points
    self.votes.where(value: -1).count
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
