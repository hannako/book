class BookmarkManager < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      flash[:message] = "Account successfully created!"
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users' do
    erb :'users/index'
  end

end
