# frozen_string_literal: true

require 'pg'
class Bookmark
  def initialize; end

  def self.all
    bookmarks_arr = []
    con = PG.connect dbname: 'bookmark_manager', user: 'tombaxter'

    rs = con.exec 'SELECT * FROM bookmarks'

    rs.each do |row|
      bookmarks_arr << "#{row['id']}. #{row['url']}"
    end
    bookmarks_arr
  rescue PG::Error => e
    puts e.message
  ensure
    rs&.clear
    con&.close
  end
end
