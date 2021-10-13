# frozen_string_literal: true

require 'bookmark'
require 'new_bookmark'

describe Bookmark do
  it 'should return all the bookmarks' do
    expect(described_class.all.class).to eq(Array)
    described_class.all.each do |bookmark|
      expect(bookmark.class).to eq(NewBookmark)
    end
    expect(described_class.all[0].title).to eq("makers")
  end
end
