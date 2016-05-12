get '/questions/:question_id/comments/new' do
  erb :'/comments/new'
end


# create a new comment on a question
post '/questions/:question_id/comments' do
  current_question = Question.find(params[:question_id])
  current_comment = current_question.comments.new(content: params[:content], author_id: current_user.id)

  if current_comment.save
    redirect "/questions/#{current_question.id}"
  else
    @errors = current_comment.errors.full_messages
    erb :"/questions/#{current_question.id}"
  end
end

# create a new comment on an answer
post '/questions/:question_id/answers/:answer_id/comments' do
  question_id = params[:question_id]
  current_answer = Answer.find(params[:answer_id])
  current_comment = current_answer.comments.new(content: params[:content], author_id: current_user.id)
  answer_id = params[:answer_id]

  if current_comment.save
    redirect "/questions/#{question_id}"
  else
    @errors = current_comment.errors.full_messages
    erb :"/questions/#{question_id}"
  end
end



