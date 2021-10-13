require 'new_bookmark'

describe NewBookmark do

  subject(:bookmark) {described_class.new(9, "http://www.schmoogle.com", "schmoogle")}

  it 'should have id, url and title attributes on initialisation' do
    expect(bookmark).to have_attributes(id: 9, url: "http://www.schmoogle.com", title: "schmoogle")
  end
end