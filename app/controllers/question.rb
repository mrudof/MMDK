get '/users/:user_id/questions' do
  @user = User.find(params[:user_id])
  @questions = @user.questions
  erb :'questions/index'
end

get '/users/:user_id/questions/new' do
  @user = User.find(params[:user_id])
  erb :'questions/new'
end

post '/users/:user_id/questions' do
  @user = User.find(params[:user_id])
  @question = @user.questions.new(params[:question])
  if @question.save
    redirect "/users/#{@user.id}/questions"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end
