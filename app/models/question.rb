class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite_answer, class_name: :Answer
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :user_id, :title, presence: true
  validates :text, presence: true, length: { in: 10..200 }
end
