get '/login' do
  erb :"/users/login"
end

post '/login' do
  if @user = User.authenticate({username: params[:username], password: params[:password]})
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Invalid username or passord"]
    erb :"/users/login"
  end
end

get '/logout' do
  session.delete(:user_id)
  erb :"/index"
end
