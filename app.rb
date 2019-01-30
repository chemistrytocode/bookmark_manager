require 'sinatra/base'
require './lib/bookmark'


class Bmm < Sinatra::Base
  enable :method_override
  get '/' do
    erb :index
  end

  get '/bookmarks' do
      @bookmarks = Bookmark.all
      erb :bookmarks
  end

  post '/add_bookmark' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

end
