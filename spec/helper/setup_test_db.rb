require 'pg'
require 'bookmarks'

def setup_test_db
  conn = PG.connect( dbname: Bookmarks::DATABASE_TEST )
  conn.exec("TRUNCATE TABLE bookmarks")
  conn.exec("INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com')")
  conn.exec("INSERT INTO bookmarks(url) VALUES('http://www.google.com')")
  conn.exec("INSERT INTO bookmarks(url) VALUES('http://www.destroyallsoftware.com')")
end
