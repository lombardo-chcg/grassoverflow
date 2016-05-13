get '/questions/:question_id/comments/new' do
  authorize!
  erb :'/comments/new'
end


# create a new comment on a question
post '/questions/:question_id/comments' do
  # authorize!
  if session[:user_id] == nil
    return status 422
  end
  question = Question.find(params[:question_id])
  comment = question.comments.new(content: params[:content], author_id: current_user.id)

  if request.xhr?
    if comment.save
      erb :'/comments/_render_question_comment', layout: false, :locals => {question: question, comment: comment}
    else
      status 422
    end
  end

  # if comment.save
  #   redirect "/questions/#{question.id}"
  # else
  #   @errors = comment.errors.full_messages
  #   erb :"/questions/#{question.id}"
  # end
end

# create a new comment on an answer
post '/questions/:question_id/answers/:answer_id/comments' do
  # authorize!
  if session[:user_id] == nil
    return status 422
  end
  question_id = params[:question_id]
  @question = Question.find(question_id)
  current_answer = Answer.find(params[:answer_id])
  comment = current_answer.comments.new(content: params[:content], author_id: current_user.id)
  # answer_id = params[:answer_id]

  if request.xhr?
    if comment.save
      erb :"/comments/_render_answer_comment", layout: false, :locals => {comment: comment}
    else
      status 422
    end
  end

  #   redirect "/questions/#{question_id}"
  # else
  #   @errors = current_comment.errors.full_messages
  #   erb :"/questions/#{question_id}"
  # end
end



