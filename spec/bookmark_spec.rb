# frozen_string_literal: true

require 'bookmark'
require 'new_bookmark'

describe BookmarkAccessor do
  it 'should return all the bookmarks' do
    expect(described_class.all.class).to eq(Array)
    described_class.all.each do |bookmark|
      expect(bookmark.class).to eq(NewBookmark)
    end
    expect(described_class.all[0].title).to eq("makers")
  end

  it 'should delete a bookmark' do
    expect{
      described_class.delete('http://www.google.com/')
    }.to change{described_class.all.length}.from(4).to(3)
  end

  it 'should delete a specific bookmark' do

    described_class.delete('http://www.google.com/')
    described_class.all.select do |bookmark| 
      expect(bookmark.url == "http://www.google.com/").to eq(false)
    end
  end
end
