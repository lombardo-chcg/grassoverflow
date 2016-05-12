get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  authorize!
  erb :'questions/new'
end

post '/questions' do
  authorize!

  title = params[:title]
  content = params[:content]

  @question = Question.new(
    title: title,
    content: content,
    author_id: current_user.id # session[:user_id]
    )

  if @question.save
    redirect '/'
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id].to_i)
  erb :'/questions/show'
end

post '/questions/:id/vote' do
  authorize!
  if params.has_key?("upvote")
    Vote.create(votable_id: params[:id], votable_type: "Question", voter_id: session[:user_id], point: true)
  else
    Vote.create(votable_id: params[:id], votable_type: "Question", voter_id: session[:user_id], point: false)
  end

  if request.xhr?
    @question = Question.find(params[:id].to_i)
    @question.count_votes.to_s
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/comments/:id/vote' do
  authorize!

  if params.has_key?("upvote")
    Vote.create(votable_id: params[:id], votable_type: "Comment", voter_id: session[:user_id], point: true)
  else
    Vote.create(votable_id: params[:id], votable_type: "Comment", voter_id: session[:user_id], point: false)
  end

  if request.xhr?
    @comment = Comment.find(params[:id].to_i)
    @comment.count_votes.to_s
  else
    redirect "/questions/#{params[:question_id]}"
  end
end

post '/answers/:id/vote' do
  authorize!
p params
  if params.has_key?("upvote")
    Vote.create(votable_id: params[:id], votable_type: "Answer", voter_id: session[:user_id], point: true)
  else
    Vote.create(votable_id: params[:id], votable_type: "Answer", voter_id: session[:user_id], point: false)
  end

  if request.xhr?
    @answer = Answer.find(params[:id].to_i)
    @answer.count_votes.to_s
  else
    redirect "/questions/#{params[:question_id]}"
  end
end
