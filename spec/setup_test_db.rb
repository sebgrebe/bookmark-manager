require 'pg'

def setup_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clean the bookmarks table in test database
  connection.exec('TRUNCATE TABLE bookmarks')
  # replace below using new Bookmark.add method
  # connection.exec("INSERT INTO bookmarks (url) VALUES (
  # 'http://www.makersacademy.com');")
  # connection.exec("INSERT INTO bookmarks (url) VALUES (
  # 'http://www.destroyallsoftware.com');")
  # connection.exec("INSERT INTO bookmarks (url) VALUES (
  # 'http://www.google.com');")
  Bookmark.add('http://www.makersacademy.com')
  Bookmark.add('http://www.destroyallsoftware.com')
  Bookmark.add('http://www.google.com')
end
