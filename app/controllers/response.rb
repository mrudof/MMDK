get '/questions/:question_id/responses/new' do
  @question = Question.find(params[:question_id])
  erb :'responses/question/new'
end

post '/responses' do
  @response = Response.new(params[:response])
  if @response.save
    binding.pry
    redirect "/questions/#{@response.respondable_id}"
  else
    @errors = @response.errors.full_messages
    erb :'responses/question/new'
  end
end
