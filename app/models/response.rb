class Response < ActiveRecord::Base
  belongs_to :respondable, polymorphic: true
  belongs_to :user
  has_many :votes, as: :votable

  validates :text, presence: true, length: { in: 10..200 }
end
