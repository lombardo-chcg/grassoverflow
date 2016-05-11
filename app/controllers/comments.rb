get '/questions/:question_id/comments/new' do
  erb :'/comments/new'
end


# create a new comment on a question
post '/questions/:question_id/comments' do
  @comment = Comment.create(content: params[:content], commentable_id: params[:question_id], author_id: session[:user_id])
  question_id = params[:question_id]

  redirect "/questions/#{question_id}"
end

# create a new comment on an answer
post '/questions/:question_id/answers/:answer_id/comments' do

end


# <input type="text" name="comment[content]">


# get "/questions/#{params[:question_id]}" do
# end#   "Hello World"

