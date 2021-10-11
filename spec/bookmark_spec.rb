require "bookmark"

describe Bookmark do
  it "should return all the bookmarks" do
    expect(described_class.all).to eq("<p>makers, hub, jiquang sunglasses</p>")
  end
end