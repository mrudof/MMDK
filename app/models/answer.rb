class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :text, presence: true, length: { in: 10..200 }

  def vote_count
    self.votes.where(upvote?: true).length - self.votes.where(upvote?: false).length
  end

end
