# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = BookmarkAccessor.all
    erb(:bookmarks)
  end

  get "/add_bookmark" do
    erb(:add_bookmark)
  end

  post "/add_bookmark" do
    BookmarkAccessor.create(params[:id], params[:url], params[:title])
    redirect '/bookmarks'
  end

  post "/delete_bookmark" do
    BookmarkAccessor.delete(params[:url])
    # TODO: add alert to say bookmark has been deleted
    redirect "/bookmarks"
  end

  run! if app_file == $PROGRAM_NAME
end
