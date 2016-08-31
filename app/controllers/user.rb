
get '/login' do
  erb :'users/login'
end


get '/users/new' do
  erb :'users/new'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect '/questions'
  else
    @errors = "Username and Password didn't match"
    erb :'users/login'
  end
end

post '/users/new' do
   @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/questions'
end

