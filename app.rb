require 'sinatra/base'
require './lib/bookmark'


class Bmm < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
      @bookmarks = Bookmark.all
  end

end
