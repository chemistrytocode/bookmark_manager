require 'sinatra/base'
require './lib/bookmark'
require './database_connection_setup'
require 'sinatra/flash'
require 'uri'



class Bmm < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  database_setup
  get '/' do
    erb :index
  end

  get '/bookmarks' do
      @bookmarks = Bookmark.all
      erb :bookmarks
  end

  post '/add_bookmark' do
    # Bookmark.create(url: params[:url], title: params[:title])
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :update
  end

  patch '/bookmarks/:id' do
    flash[:notice] = "WRONG!" unless Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks') #if Bookmark.valid_url?(url: params[:url])
  end
end
