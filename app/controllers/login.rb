get '/login' do
  erb :'login/new'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if !user.nil? && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    erb :'login/new'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
