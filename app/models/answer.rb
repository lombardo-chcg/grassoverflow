class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def count_votes
    votes.where(point: true).count - votes.where(point: false).count
  end
end
