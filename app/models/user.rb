class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id

  validates :password_string, presence: true, length: {minimum: 1}
  validates :username, presence: true, length: {minimum: 1}
  validates :email, presence: true, length: {minimum: 1}

  def password
    @password ||= BCrypt::Password.new(hash_word)
  end

  def password=(new_password)
    @password_string = new_password
    @password = BCrypt::Password.create(new_password)
    self.hash_word = @password
  end

  def self.authenticate(user_data)
    user = User.find_by(username: user_data[:username])
    return user if user && user.password == user_data[:password]
    nil
  end

  private

  attr_reader :password_string
end
