User.destroy_all
Question.destroy_all
Answer.destroy_all
Comment.destroy_all
Vote.destroy_all

5.times do
  User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
    )
end

20.times do
  Question.create!(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph,
    author_id: rand(1..5)
    )
end

100.times do
  Answer.create!(
    content: Faker::Hipster.paragraph,
    question_id: rand(1..20),
    author_id: rand(1..5)
    )
end

# answers 21 through 50 will not have votes
possible_types = %w(Question Answer)
300.times do
  Comment.create!(
    content: Faker::Hipster.paragraph,
    commentable_type: possible_types.sample,
    commentable_id: rand(1..20),
    author_id: rand(1..5)
    )
end

200.times do
  Vote.create!(
    votable_type: 'Question',
    voter_id: rand(1..5),
    votable_id: rand(1..20),
    point: [true, false].sample
    )
end

200.times do
  Vote.create!(
    votable_type: ['Answer', 'Comment'].sample,
    voter_id: rand(1..5),
    votable_id: rand(1..50),
    point: [true, false].sample
    )
end
