require 'pg'

class Bookmark

attr_reader :bookmarks

  def self.all
    conn = PG.connect( dbname: 'bookmark_manager')
    result = conn.exec( "SELECT * FROM bookmarks;" )
    result.map { |bookmark| bookmark['url']}
  end

end
