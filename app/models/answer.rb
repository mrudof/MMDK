class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :responses, as: :respondable
  has_many :votes, as: :votable

  validates :text, presence: true, length: { in: 10..200 }
end
