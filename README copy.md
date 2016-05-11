# Team Name
GrassOverflow.com

# Members
Alex Wen (thatnewwen)
Andrey Slonski (aslonski)
Ryan Dempsey (rmdemp)
Tomasz Sok (tomsapps)
Dominick Lombardo (lombardo-chcg)

# MVP User Stories
* user can post questions
* user can post answer to questions
* user can comment on questions and answers
* the author can choose "the sharpest blade," aka the best answer
* users can upvote and downvote on questions, answers and comments
* users can only view all content when not logged in
* when logged in users can post questions, answers, comments and vote


## Users
```
has many questions
has many answers
has many comments
has many votes
```

## Questions
```
belongs to author
has many answers (class user)
has many comments (poly)
has many votes (poly)
```

## Answers
```
belongs to question
belongs to author (class user)
has many comments (poly)
has many votes (poly)
```

## Comments
```
belongs to author (class user)
belongs to question (poly)
belongs to answer (poly)
has many votes
```

## Votes
```
belongs to voter (class user)
belongs to question (poly)
belongs to answer (poly)
belongs to comment (poly)
```
