require 'pg'
require 'uri'
# this class connects to a database
class Bookmark
  def self.all
    self.connect_db

    table = @connection.exec('SELECT * FROM bookmarks')
    p table
    # bookmarks = table.map { |row| row.values_at('url') }
    # ^returns array of arrays (which in turn contain strings):
    # [['urlname1'], ['urlname2'], ['urlname3']]
    # but what we need is something like this:
    # ['urlname1', 'urlname2', 'urlname3']:
    table.map { |row| {id: row['id'], url: row['url'], title: row['title'] } }
  end

  def self.add(url,title)
    self.connect_db
    @connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.connect_db
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.delete(id)
    self.connect_db
    @connection.exec("DELETE FROM bookmarks WHERE id=#{id}")
  end

  def self.update(id,url,title)
    self.connect_db
    @connection.exec("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id=#{id}")
  end

  def self.valid?(address)
    return true if (address =~ URI::regexp) == 0
    false
  end
end
