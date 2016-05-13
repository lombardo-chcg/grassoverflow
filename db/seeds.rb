User.destroy_all
Question.destroy_all
Answer.destroy_all
Comment.destroy_all
Vote.destroy_all

25.times do
  User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
    )
end

grass_questions = [
"Why does my hair smell like grass?",
"Can I eat grass for dinner?",
"I have 5 pounds of grass for sale.  Any takers?",
"Seeds taste good, right?",
"I found some stems in my grass, will my mom be mad?",
"Can we roll in the grass please?",
"Do you prefer thousand island or ranch on your grass?",
"I eat grass with my dog. Will you be my friend? (conversation starter)",
"I like bluegrass.  But my wife prefers crabgrass. Is our marriage doomed??",
"Rabbits, good or bad for the grass?",
"Any goat enthusiasts in the house? 🐐 "
]

20.times do
  Question.create!(
    title: grass_questions.sample,
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
