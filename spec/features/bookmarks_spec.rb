feature 'Bookmarks page' do
  scenario 'Visits index page and has all bookmarks' do
    visit("/bookmarks")
    expect(page).to have_content("makers, hub, jiquang sunglasses")
  end
end