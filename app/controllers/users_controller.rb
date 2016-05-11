get '/users' do
  
end

get '/users/new' do

  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect "/login"
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id' do
  authorize!
  
  if current_user
    erb :"users/show"
  else
    redirect '/login'
  end
end