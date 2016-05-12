class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :votes, as: :votable
  belongs_to :commentable, polymorphic: true

  def count_votes
    votes.where(point: true).count - votes.where(point: false).count
  end
end
