require 'sinatra/base'


class Bmm < Sinatra::Base

  get '/' do
    erb :index
  end

end
