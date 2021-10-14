# frozen_string_literal: true

require 'pg'
require_relative 'new_bookmark'
class BookmarkAccessor
  def initialize; end

  def self.all
    bookmarks_arr = []
    database_name = ENV['RACK_ENV'] == 'development' ? 'bookmark_manager' : 'bookmark_manager_test'
    con = PG.connect dbname: database_name, user: ENV['USER']

    rs = con.exec 'SELECT * FROM bookmarks'

    rs.each do |row|
      bookmarks_arr << NewBookmark.new(row['id'], row['url'], row['title'])

    end
    bookmarks_arr

  # :nocov: 
  rescue PG::Error => e
    puts e.message
  # :nocov:
  ensure
    rs&.clear
    con&.close
  end

  # init with all data 
  # return a book mark as a object { :url : www.goog.com }

  def self.create(id, url, title)
    # TODO: add this to connect_to_db helper
    database_name = ENV['RACK_ENV'] == 'development' ? 'bookmark_manager' : 'bookmark_manager_test'
    con = PG.connect dbname: database_name, user: ENV['USER']
  
    con.exec_params("INSERT INTO bookmarks(id, url, title) VALUES ($1, $2, $3);", [id, url, title])
  end

  def self.delete(url)
    database_name = ENV['RACK_ENV'] == 'development' ? 'bookmark_manager' : 'bookmark_manager_test'
    con = PG.connect dbname: database_name, user: ENV['USER']
    con.exec("DELETE FROM bookmarks WHERE url = '#{url}'")
  end
end
