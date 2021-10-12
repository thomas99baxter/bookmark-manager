# frozen_string_literal: true
require 'pg'

feature 'Bookmarks page' do
  scenario 'Visits index page and has all bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content(
      "Id Url 1 http://www.makersacademy.com/ 2 http://www.schmakersacademy.com/ 4 http://www.google.com/ 3 http://www.twitter.com/"
    )
  end
end
