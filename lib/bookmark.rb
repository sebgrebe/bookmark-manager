require 'pg'
require 'uri'
# this class connects to a database
class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    table = connection.exec('SELECT * FROM bookmarks')

    # bookmarks = table.map { |row| row.values_at('url') }
    # ^returns array of arrays (which in turn contain strings):
    # [['urlname1'], ['urlname2'], ['urlname3']]
    # but what we need is something like this:
    # ['urlname1', 'urlname2', 'urlname3']:
    table.map { |row| row['url'] }
  end

  def self.add(url,title)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}, #{title}')")
  end

  def self.valid?(address)
    return true if (address =~ URI::regexp) == 0
    false   
  end
end
