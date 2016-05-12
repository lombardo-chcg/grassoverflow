post '/questions/:question_id/answers/new' do
  authorize!

  @question = Question.find(params[:question_id].to_i)

  p params

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
  question = Question.find(params[:question_id])

  question.answers.each do |answer|
    answer.sharpest_blade = false
    answer.save
  end

  answer = Answer.find(params[:id])
  answer.sharpest_blade = true
  answer.save

  redirect "/questions/#{params[:question_id]}"
end
