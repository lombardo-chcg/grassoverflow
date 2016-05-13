post '/questions/:question_id/answers/new' do
  # authorize!
  if session[:user_id] == nil
    return status 422
  end

  @question = Question.find(params[:question_id].to_i)

  answer = @question.answers.new(
    content: params[:content],
    author_id: current_user.id
    )

  result = answer.save

  if request.xhr?
    if result != nil
      erb :"/answers/_render_answer", :layout => false, :locals => { answer: answer, question: @question }
    else
      status 422
    end
  else
    if result != nil
      redirect "/questions/#{question.id}"
    else
      @errors = current_comment.errors.full_messages
      erb :"/questions/#{question_id}"
    end
  end
end

put '/questions/:question_id/answers/:id' do
  # authorize!
  if session[:user_id] == nil
    return status 422
  end

  question = Question.find(params[:question_id])

  question.answers.each do |answer|
    answer.sharpest_blade = false
    answer.save
  end

    answer = Answer.find(params[:id])
    answer.sharpest_blade = true
  if request.xhr?
    if answer.save
      "true"
    else
      status 422
    end
  else
    if answer.save
      redirect "/questions/#{params[:question_id]}"
    else
      @errors = answer.errors.full_messages
      erb :"/questions/#{question_id}"
    end
  end
end
