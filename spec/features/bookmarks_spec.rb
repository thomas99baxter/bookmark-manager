# frozen_string_literal: true
require 'pg'

feature 'Bookmarks page' do
  scenario 'Visits index page and has all bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content(
      "Id Title 1 makers 2 schmakers 4 google 3 twitter"
    )
  end
end
