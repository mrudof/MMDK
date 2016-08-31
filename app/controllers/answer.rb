get 'question/:id' do

end

post '/answers' do
  @answer = Answer.new(text: params[:text], user_id: session[:user_id], question_id: params[:id])
  if request.xhr?
    if @answer.save
      erb :'answers/new_answer', layout: false
    else
      status 422
      @errors = @answer.errors.full_messages
      erb :'answers/errors', layout: false
       # redirect "/questions/#{params[:id]}"
    end
  end
end



