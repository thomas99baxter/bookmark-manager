require 'sinatra'
require "sinatra/reloader" if development?
require "./lib/bookmark"

class BookmarkManager < Sinatra::Base

  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get "/" do
    erb(:index)
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  run! if app_file == $0

end