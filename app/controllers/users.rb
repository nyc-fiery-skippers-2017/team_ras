get '/' do
  redirect '/questions/index'
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Login failed,", "please try again"]
    erb :'/users/login'
  end
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
 @user = User.find_by(id: params[:id])
 session[:user_id] = @user.id
 erb :'/users/show'
end

get '/logout' do
  session.clear
  redirect '/'
end
