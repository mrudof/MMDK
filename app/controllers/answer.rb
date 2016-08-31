get 'question/:id' do

end

post '/answers' do
  @answer = Answer.new(text: params[:text], user_id: sessions[:user_id], question_id: params[:id])
  if @answer.save
    if response.xhr?
      JSON.generate(@answer)
    end
    redirect "/questions/#{params[:id]}"
  else
    @errors = @answer.errors.full_messages
    erb :'answers/new'
  end

end



