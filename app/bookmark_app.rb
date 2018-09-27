require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'

# This is the controller for our Bookmark app
class BookmarkApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  get '/create' do
    erb(:create)
  end

  post '/create' do
    if Bookmark.valid?(params[:URL])
      Bookmark.add(params[:URL], params[:title])
    else
      flash[:warning] = 'This is not a valid URL'
    end
    redirect '/bookmarks'
  end
  
  run! if app_file == $PROGRAM_NAME
end
