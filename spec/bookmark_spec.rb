# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  it 'should return all the bookmarks' do
    expect(described_class.all.class).to eq(Array)
    expect(described_class.all).to eq(
      [
        "1,http://www.makersacademy.com/,makers", 
        "2,http://www.schmakersacademy.com/,schmakers", 
        "4,http://www.google.com/,google", 
        "3,http://www.twitter.com/,twitter"
      ]
    )
  end
end
