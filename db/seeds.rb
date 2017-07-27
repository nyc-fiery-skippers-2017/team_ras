require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

users = []
questions = []
answers = []
vote_value = [1,-1]

100.times do
  users << User.create(:username => Faker::Name.first_name, :email => Faker::Internet.email, :password => 'password' )
end

200.times do
  questions << Question.create(:title => 'Who Said This Quote?', :body => Faker::RickAndMorty.quote, :creator => users.sample)
end

questions.each do |question|
  5.times do
    question.comment.create(:body => Faker::TheFreshPrinceOfBelAir.quote, :commenter => users.sample)
    question.votes.create(:value => vote_value.sample, :voter => users.sample)
  end
end

200.times do
  answers << Answer.create(:body => Faker::RickAndMorty.character, :responder => users.sample, :question => questions.sample)
end

answer.each do |answer|
  5.times do
    answer.comment.create(:body => Faker::TheFreshPrinceOfBelAir.quote, :commenter => users.sample)
    answer.votes.create(:value => vote_value.sample, :voter => users.sample)
  end
end
