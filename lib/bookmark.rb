require 'pg'

class Bookmark

attr_reader :bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end

    result = conn.exec( "SELECT * FROM bookmarks;" )
    result.map { |bookmark| bookmark['url']}
  end

  def self.add(url)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    conn.exec( "INSERT INTO bookmarks (url) values('#{url}');" )
  end

end
