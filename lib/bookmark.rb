require 'pg'
require 'uri'
require_relative 'database_connection'

class Bookmark

attr_reader :id, :title, :url, :bookmarks

def initialize(id:, title:, url:)
  @id = id
  @title = title
  @url = url
end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(
        url: bookmark['url'],
        title: bookmark['title'],
        id: bookmark['id'],
      )
    end
  end

  def self.create(url:, title:)
    return false unless valid_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    Bookmark.new(
      id: result[0]['id'],
      title: result[0]['title'],
      url: result[0]['url']
    )
  end

  def self.delete(id:)
    result = DatabaseConnection.query("DELETE FROM bookmarks WHERE id=#{id}")
  end

  def self.update(id:, url:, title:)
    return false unless valid_url?(url)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(
      id: result[0]['id'],
      title: result[0]['title'],
      url: result[0]['url']
    )
  end


  def self.find(id:)
    
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(
      id: result[0]['id'],
      title: result[0]['title'],
      url: result[0]['url']
    )
  end

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end


end
