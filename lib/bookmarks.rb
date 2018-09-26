require 'pg'

class Bookmarks

  DATABASE_DEV = 'bookmark_manager'
  DATABASE_TEST = 'bookmark_manager_test'
  @db_name = ENV['RACK_ENV'] == 'test' ? DATABASE_TEST : DATABASE_DEV

  @conn = PG.connect( dbname: @db_name )

  def self.all
    retrieve_urls
  end

  def self.add(url)
    add_url(url)
  end

  def self.retrieve_urls
    @conn.exec( "SELECT url FROM bookmarks") do |result|
      return formater(result)
    end
  end

  def add_url()
    @conn.exec( "INSERT INTO bookmarks(url) VALUES(#{url})")
  end

  def self.formater(data)
    urls = []
    data.each do |line|
      urls << line['url']
    end
    urls
  end

end
