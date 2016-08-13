class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
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

end
