get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @question_comments = @question.comments
  erb :'questions/show'
end

post '/questions' do
  @user = current_user
  @question = @user.questions.new(params[:question])
  if @question.save
    redirect "/questions"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  @vote = Vote.create(votable_id: params[:id], votable_type: "Question", upvote?: true, user_id: session[:user_id])
  if request.xhr?
    @question.vote_count.to_s
  end
end

post '/questions/:id/downvote' do
  @question = Question.find(params[:id])
  @vote = Vote.create(votable_id: params[:id], votable_type: "Question", upvote?: false, user_id: session[:user_id])
  if request.xhr?
    @question.vote_count.to_s
  end
end
