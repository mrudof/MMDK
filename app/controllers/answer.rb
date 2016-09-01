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
    end
  else
    if @answer.save
      redirect "/questions/#{params[:id]}"
    else
      @errors = @answer.errors.full_messages
      erb :'answers/new'
    end
  end
end

post '/questions/:id/answers/:answer_id/upvote' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  @vote = Vote.create(votable_id: params[:answer_id], votable_type: "Answer", upvote?: true, user_id: session[:user_id])
  if request.xhr?
    @answer.vote_count.to_s
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:id/answers/:answer_id/downvote' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  @vote = Vote.create(votable_id: params[:answer_id], votable_type: "Answer", upvote?: false, user_id: session[:user_id])
  if request.xhr?
    @answer.vote_count.to_s
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  @question = Question.find(@answer.question.id)
  @question.favorite_answer_id = @answer.id
  @question.save
  if request.xhr?
    "<p id=\"favorite-#{@question.id}\">Favorite answer!</p>"
  else
    redirect "/question/#{@question.id}"
  end
end

