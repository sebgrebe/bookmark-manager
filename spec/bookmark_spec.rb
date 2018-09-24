require 'bookmark.rb'

describe Bookmark do

  describe "#create_bookmark" do
    xit "creates a bookmark and returns it" do
      expect(subject.create_bookmark("Makers", "fake-url", "fake-description")).to eq({
          title: "Makers",
          url: "fake-url",
          description: 'fake-description'
        })
    end
  end

  describe "#add_bookmark" do
    xit "adds a bookmark to bookmarks array" do
      bookmark = subject.create_bookmark("Makers", "fake-url", "fake-description")
      subject.add_bookmark(bookmark)
      expect(subject.bookmarks).to include bookmark
    end
  end

  describe "#all" do
    it "returns bookmarks array" do
      expect(Bookmark.all).to eq(described_class::DEFAULT_BOOKMARKS)
    end
  end
end
