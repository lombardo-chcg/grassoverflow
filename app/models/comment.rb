class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :votes
  belongs_to :commentable, polymorphic: true

end
