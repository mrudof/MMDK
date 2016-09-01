get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  if request.xhr?
    erb :'comments/question/new', layout: false
  else
    erb :'comments/question/new'
  end
end

get '/questions/:question_id/answers/:answer_id/comments/new' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:answer_id])
  if request.xhr?
    erb :'comments/answer/new', layout: false
  else
    erb :'comments/answer/new'
  end
end

# POST request for comments on questions
post '/question/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    if request.xhr?
      erb :'comments/_newly_added_comment', layout: false
    else
      redirect "/questions/#{@comment.commentable_id}"
    end
  else
    @errors = @comment.errors.full_messages
    erb :'comments/question/new'
  end
end

# POST request for comments on answers
post '/answer/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    if request.xhr?
      erb :'comments/_newly_added_comment', layout: false
    else
      @answer = Answer.find(@comment.commentable_id)
      redirect "/questions/#{@answer.question.id}"
    end
  else
    @errors = @comment.errors.full_messages
    erb :'comments/answer/new'
  end
end

