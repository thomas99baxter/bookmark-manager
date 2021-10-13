feature 'Add bookmark' do
  it 'should add a bookmark to the database' do
    visit("/bookmarks")
    click_button "Add bookmark" # go to /add_bookmark
    expect(page).to have_field("id")
    expect(page).to have_field("url")
    expect(page).to have_field("title")

    fill_in("id", with: "5")
    fill_in("url", with: "http://foogywoogyoogle.com")
    fill_in("title", with: "Foogy")
    click_button "Submit"
    expect(page).to have_content("http://foogywoogyoogle.com")
  end
end