get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  erb :'comments/question/new'
end

post '/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@comment.commentable_id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/question/new'
  end
end
