get 'question/:id' do

end

post '/answers' do
  @answer = Answer.new(text: params[:text], user_id: session[:user_id], question_id: params[:id])
  if @answer.save
    if request.xhr?
      erb :'answers/new_answers'
    end
    redirect "/questions/#{params[:id]}"
  else
    @errors = @answer.errors.full_messages
    erb :'answers/new'
  end

end



