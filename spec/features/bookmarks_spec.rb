# frozen_string_literal: true
require 'pg'

feature 'Bookmarks page' do
  scenario 'Visits index page and has all bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content("Id Title")
    expect(page).to have_content("1 makers")
    expect(page).to have_content("2 schmakers")
    expect(page).to have_content("4 google")
    expect(page).to have_content("3 twitter")
    click_link('google')
  end
end
