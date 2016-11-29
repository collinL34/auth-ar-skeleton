get '/users/new' do
  erb :'users/new'
end

post '/users' do
  new_user = User.create(params[:user])

  if !new_user.nil?
    session[:user_id] = new_user.id
    redirect "/users/#{new_user.id}"
  else
    redirect 'users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

end
