require 'pg'


def persisted_data(id:)
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.query("SELECT * FROM bookmarks WHERE id = '#{id}';")
end
