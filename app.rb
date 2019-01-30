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
    Bookmark.create(url: params[:url], title: params[:title])
    # Bookmark.create(params[:title], params[:url])
    redirect '/bookmarks'
  end

end
