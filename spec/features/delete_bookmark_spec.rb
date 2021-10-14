feature 'Delete bookmarks' do
  scenario 'it should delete the correct bookmark' do
    visit("/bookmarks")
    within("//tr[@id='4']") do
      click_button("Delete Bookmark")
    end
    expect(page).to_not have_content("google")
  end
end