# frozen_string_literal: true

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
# require 'features/web_helpers'
require 'pg'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console,
                                                                 # Want a nice code coverage website? Uncomment this next line!
                                                                 SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BookmarkManager

RSpec.configure do |config|

  config.before(:each) do

    con = PG.connect dbname: 'bookmark_manager_test', user: ENV['USER']
    con.exec "TRUNCATE bookmarks;"
    con.exec 'INSERT INTO "bookmarks" ("id", "url", "title") VALUES (1, \'http://www.makersacademy.com/\', \'makers\');'
    con.exec 'INSERT INTO "bookmarks" ("id", "url", "title") VALUES (2, \'http://www.schmakersacademy.com/\', \'schmakers\');'
    con.exec 'INSERT INTO "bookmarks" ("id", "url", "title") VALUES (4, \'http://www.google.com/\', \'google\');'
    con.exec 'INSERT INTO "bookmarks" ("id", "url", "title") VALUES (3, \'http://www.twitter.com/\', \'twitter\');'

  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
