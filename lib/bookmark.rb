
class Bookmark
  attr_reader :bookmarks

  DEFAULT_BOOKMARKS = [{
      title: "Makers",
      url: "https://makers.tech",
      description: 'makers description'
    },
    {
        title: "Google",
        url: "https://google.com",
        description: 'data privacy concerns'
    }]

  def self.all
    DEFAULT_BOOKMARKS
  end

  # def create_bookmark(title, url, description)
  #   {title: title,
  #    url: url,
  #    description: description}
  # end
  #
  # def add_bookmark(bookmark)
  #   @bookmarks << bookmark
  # end
end
