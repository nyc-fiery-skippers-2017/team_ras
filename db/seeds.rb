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
  questions << Question.create(:title => 'What does this mean?!', :body => Faker::Lorem.paragraph, :creator => users.sample)
end

questions.each do |question|
  5.times do
    question.comments.create(:body => Faker::Lorem.sentences, :commenter => users.sample)
  end
end

200.times do
  answers << Answer.create(:body => Faker::Lorem.words, :responder => users.sample, :question => questions.sample)
end

answers.each do |answer|
  5.times do
    answer.comments.create(:body => Faker::Lorem.words, :commenter => users.sample)
  end
end
