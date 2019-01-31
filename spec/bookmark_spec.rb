require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it "Returns a list of bookmarks from database" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
    #add test data
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      Bookmark.create(url: "http://www.yahoo.com", title: "Yahoo")
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 2
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'http://www.google.com'
    end
  end

  describe '.create' do
    it 'should create a new bookmark +add it to the database' do
      bookmark = Bookmark.create(url: 'http://www.test.com', title: 'test')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'test'
      expect(bookmark.url).to eq 'http://www.test.com'
    end

    it "should not create a new bookmark if URL is not valid" do
      Bookmark.create(url: 'random stuff', title: 'random stuff')
      expect(Bookmark.all).not_to include "random stuff"
    end
  end

  describe '.delete' do
    it 'should delete a selected bookmark and remove it from database' do
      bookmark = Bookmark.create(url: 'http://www.test.com', title: 'test')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'should allow a bookmark to be edited and updated' do
      bookmark = Bookmark.create(url: 'http://www.test.com', title: 'test')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.updatedtest.com', title: 'updated test')
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'updated test'
      expect(updated_bookmark.url).to eq 'http://www.updatedtest.com'
    end
  end
end
