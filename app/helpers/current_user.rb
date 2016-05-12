helpers do
  def current_user
    @_cached_user ||= User.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    session[:user_id] != nil
  end

  def authorize!
    redirect '/login' unless logged_in?
  end

  def redirect_unless_self(id)
    redirect '/' unless current_user.id == id
  end

  def author_logged_in?(question)
    if logged_in?
      current_user.id == question.author.id
    end
  end
end
