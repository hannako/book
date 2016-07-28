ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './app/data_mapper_setup'

class BookmarkManager < Sinatra::Base

enable :sessions

  get '/' do
    erb :'index'
  end

  post '/register' do
    user = User.create(name: params[:name], email: params[:email])
    user.password = params[:password]
    user.save
    session[:name] = params[:name]
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
