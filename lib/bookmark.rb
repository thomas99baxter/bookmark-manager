# frozen_string_literal: true

require 'pg'
class Bookmark
  def initialize; end

  def self.all
    bookmarks_arr = []
    database_name = ENV['RACK_ENV'] == 'development' ? 'bookmark_manager' : 'bookmark_manager_test'
    con = PG.connect dbname: database_name, user: ENV['USER']

    rs = con.exec 'SELECT * FROM bookmarks'

    rs.each do |row|
      bookmarks_arr << "#{row['id']},#{row['url']},#{row['title']}"
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
    database_name = ENV['RACK_ENV'] == 'development' ? 'bookmark_manager' : 'bookmark_manager_test'
    con = PG.connect dbname: database_name, user: ENV['USER']

    con.exec("INSERT INTO bookmarks(id, url, title) VALUES (#{id}, '#{url}', '#{title}');")
  end
end
