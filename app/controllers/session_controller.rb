get '/login' do
  erb :"/users/login"
end

post '/login' do
  if @user = User.authenticate({username: params[:username], password: params[:password]})
    session[:user_id] = @user.id
    # redirect "/users/#{@user.id}"
    redirect "/"
  else
    @errors = ["Invalid username or passord"]
    erb :"/users/login"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
