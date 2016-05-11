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
  erb :'questions/show'
end
