require 'pg'

def setup_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clean the bookmarks table in test database
  connection.exec('TRUNCATE TABLE bookmarks')
  Bookmark.add('http://www.makersacademy.com', 'Makers')
  Bookmark.add('http://www.destroyallsoftware.com', 'DestroyAllSoftware')
  Bookmark.add('http://www.google.com', 'Google')
end
