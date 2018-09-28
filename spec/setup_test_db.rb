require 'pg'

def setup_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clean the bookmarks table in test database
  connection.exec('DROP TABLE bookmarks')
  connection.exec('CREATE TABLE bookmarks (id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60))')
  Bookmark.add('http://www.makersacademy.com', 'Makers')
  Bookmark.add('http://www.destroyallsoftware.com', 'DestroyAllSoftware')
  Bookmark.add('http://www.google.com', 'Google')
end
