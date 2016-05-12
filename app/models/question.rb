class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def count_votes
    votes.where(point: true).count - votes.where(point: false).count
  end
end
