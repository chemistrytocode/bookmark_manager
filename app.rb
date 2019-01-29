require 'sinatra/base'
require './lib/bookmark'


class Bmm < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
      @bookmarks = Bookmark.all
      erb :bookmarks
  end

  post '/add_bookmark' do
    url = params[:url]
    Bookmark.add(url)
    redirect '/bookmarks'
  end

end
