
#User login authentication
get '/login' do
  erb :'/users/login'
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/login'
  end
end
#User Homepage?
get '/users' do

  erb :'/users/index'
end

#create users
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

#Users Profile
get '/users/:id' do
  #turning this on requires you to login with a password
  if logged_in?
    @user = current_user
    erb :'/users/show'
  else
   redirect '/login'
  end
end

#Route could change to Homepage
get '/logout' do
  session.clear
  redirect '/users'
end
