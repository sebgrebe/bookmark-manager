require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }

  describe '.all' do
    it 'returns all saved bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.add' do
    #finish writing test for adding title and url
    it 'saves title and url bookmark' do
      Bookmark.add('http://www.amazon.com', 'Amazon')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.amazon.com')
    end
  end

  describe '.valid?' do
    it 'returns false if a bookmark is not valid' do
      expect(Bookmark.valid?('This is not a valid url')).to eq(false)
    end
  end

end
