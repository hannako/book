ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './app/data_mapper_setup'

class BookmarkManager < Sinatra::Base

enable :sessions
set :session_secret, "super duper secret"

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  get '/' do
    erb :'index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/register' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    # tag = Tag.create(name: params[:tags])
    # link.tags << tag
    tags = params[:tags].split(',').map(&:strip)
    tags.each do |tag|
      tag = Tag.first_or_create(name: tag)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
