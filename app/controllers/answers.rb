post '/answers/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  if logged_in?
    new_answer = Answer.new(body: params[:body], responder_id: current_user.id, question_id: @question.id)
    if new_answer.save
      if request.xhr?
          erb :'_answer', locals: {answer: new_answer}, layout: false
      else
        redirect "/questions/#{@question.id}"
      end
    else
      @errors = ["Answer could not be saved", "Please contact the our team"]
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = ["Please login to add answers and comments"]
    redirect '/login'
  end
end
