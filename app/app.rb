require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::BASE
  get '/links'do
    @links = Link.all
    erb :'links/index'
  end
end
