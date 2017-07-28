post '/answers/:question_id' do
  #:id here is the answer id
  @question = Question.find_by(id: params[:question_id])
  if logged_in?
    new_answer = Answer.new(body: params[:body], responder_id: current_user.id, question_id: @question.id)
    if new_answer.save
      redirect "/questions/#{@question.id}"
    else
      @errors = ["Answer could not be saved", "Please contact the RAS Team"]
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = ["Please login to add answers and comments"]
    redirect '/login'
  end
end
