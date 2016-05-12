class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :votable, polymorphic: true

  # validates :voter, :uniqueness => {scope: [:votable_type, :votable]}
  # validates :voter, {:uniqueness => {scope: :votable}
  # Vote.find_or_create_by(votable: answer1, voter: user)

end


