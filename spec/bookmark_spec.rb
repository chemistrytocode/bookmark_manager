require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it "Returns a list of bookmarks from database" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
    #add test data
      bookmark = Bookmark.create(url: "www.google.com", title: "Google")
      Bookmark.create(url: "www.yahoo.com", title: "Yahoo")
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 2
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'www.google.com'
    end
  end

  describe '.create' do
    it 'should create a new bookmark +add it to the database' do
      bookmark = Bookmark.create(url: 'www.test.com', title: 'test')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'test'
      expect(bookmark.url).to eq 'www.test.com'
    end
  end

  describe '.delete' do
    it 'should delete a selected bookmark and remove it from database' do
      bookmark = Bookmark.create(url: 'www.test.com', title: 'test')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end
end
