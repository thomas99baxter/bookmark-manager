# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  it 'should return all the bookmarks' do
    expect(described_class.all.class).to eq(Array)
    expect(described_class.all).to eq(
      [
        "1,http://www.makersacademy.com/", 
        "2,http://www.schmakersacademy.com/", 
        "4,http://www.google.com/", 
        "3,http://www.twitter.com/"
      ]
    )
  end
end
