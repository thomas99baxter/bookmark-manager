feature 'Can update bookmarks' do
  scenario '' do
    visit("/bookmarks")
    within("//tr[@id='4']") do
      click_button("Update Bookmark")
    end
    expect(page).to have_field("url")
    expect(page).to have_field("title")
    fill_in("url", with: "http://bing.com")
    fill_in("title", with: "bing")
    expect(page).to_not have_content("google")
    expect(page).to have_content("bing")
  end
end