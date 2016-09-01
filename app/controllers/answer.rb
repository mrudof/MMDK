get 'question/:questid' do

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

post '/questions/:id/answers/:id/upvote' do
  @answer = Answer.find(params[:id])
  @vote = Vote.create(votable_id: params[:id], votable_type: "Answer", upvote?: true, user_id: session[:user_id])
  if request.xhr?
    @answer.vote_count.to_s
  end
end

post '/questions/:id/answers/:id/downvote' do
  @answer = Answer.find(params[:id])
  @vote = Vote.create(votable_id: params[:id], votable_type: "Answer", upvote?: false, user_id: session[:user_id])
  if request.xhr?
    @answer.vote_count.to_s
  end
end

