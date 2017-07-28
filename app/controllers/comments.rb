post '/comments/:answer_id' do
  #:id here is the answer id
  @answer = Answer.find_by(id: params[:answer_id])
  @comment = Comment.new(body: params[:body], commenter: current_user.id, commentable: @answer)
  if @comment.save
    redirect "/questions/#{@answer.question_id}"
  else
    @errors = ["Comment could not be saved", "Please try again"]
    redirect "/questions/#{@answer.question_id}"
  end
end

put '/comments/:id/edit' do
  comment = Comment.find_by(id: params[:id])
  comment.update(body: params[:body])
  redirect "/questions/#{@answer.question_id}"
end

# may do a delete -- if have time :)

# delete '/comments/:id' do
#   comment = Comment.find_by(id: params[:id])
#   comment.destroy
#   redirect
# end