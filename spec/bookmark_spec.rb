require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }

  describe '.all' do
    it 'returns all saved bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include({url: 'http://www.makersacademy.com', title: 'Makers'})
      expect(bookmarks).to include({url: 'http://www.destroyallsoftware.com', title: 'DestroyAllSoftware'})
      expect(bookmarks).to include({url: 'http://www.google.com', title: 'Google'})
    end
  end

  describe '.add' do
    it 'saves title and url bookmark' do
      Bookmark.add('http://www.amazon.com', 'Amazon')
      bookmarks = Bookmark.all
      expect(bookmarks).to include({url: 'http://www.amazon.com', title: 'Amazon'})
    end
  end

  describe '.valid?' do
    it 'returns false if a bookmark is not valid' do
      expect(Bookmark.valid?('This is not a valid url')).to eq(false)
    end
  end

end
