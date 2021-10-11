feature 'Has an index page' do
  scenario 'Visits index page and has content' do
    visit("/")
    expect(page).to have_content("Hello")
  end
end