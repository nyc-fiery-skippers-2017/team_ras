get '/questions/index' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  if logged_in?
    @question = Question.new(creator_id: current_user.id, title: params[:title], body: params[:question_body])
    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @errors = ["An error occured..."]
      erb :'/questions/new'
    end
  else
    @errors = ["Please log in..."]
    redirect '/login'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

post '/questions/:id/upvote' do
  if logged_in?
    @question = Question.find(params[:id])
    @vote = @question.votes.create(voter_id: current_user.id, value: 1)
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Please log in..."]
    redirect '/login'
  end
end

post '/questions/:id/downvote' do
  if logged_in?
  @question = Question.find(params[:id])
  @vote = @question.votes.create(voter_id: current_user.id, value: -1)
  redirect "/questions/#{@question.id}"
  else
    @errors = ["Please log in..."]
    redirect '/login'
  end
end
