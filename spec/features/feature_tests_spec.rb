require 'pg'
require 'uri'

feature 'Testing infrastructure' do
    scenario 'It should visit main page and display hello world.' do
    visit ('/')
    expect(page).to have_content "Hello!"
  end
end

feature 'Adding bookmarks' do
  scenario 'I can add a bookmark to the Bookmark Manager' do
    visit('/bookmarks')
    fill_in('url', with: 'http://www.tesco.com')
    fill_in('title', with: 'Tesco')
    click_button('create Bookmark')
    expect(page).to have_link("Tesco", href: "http://www.tesco.com")
  end
  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks')
    fill_in('url', with: 'not a real bookmark')
    fill_in('title', with: 'not a real bookmark')
    click_button('Submit')
    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end


feature 'Viewing bookmarks' do
    scenario "Displays all bookmarks" do
      Bookmark.create(url: "http://www.google.com", title: "Google")
      Bookmark.create(url: "http://www.yahoo.com", title: "Yahoo")
      visit('/bookmarks')
      expect(page).to have_link("Google", href: "http://www.google.com")
      expect(page).to have_link("Yahoo", href: "http://www.yahoo.com")
    end
  end


feature 'Deleting bookmarks' do
  scenario "Delete selected bookmarks" do
    Bookmark.create(url: "https://www.yahoo.com", title: "Yahoo")
    Bookmark.create(url: "http://www.google.com", title: "Google")
    visit('/bookmarks')
    first('.bookmark').click_button('delete this!')
    expect(page).not_to have_link("Yahoo", href: "https://www.yahoo.com")
  end
end


feature 'Updating bookmarks' do
  scenario "update selected bookmark" do
    Bookmark.create(url: "https://www.yahoo.com", title: "Yahoo")
    visit('/bookmarks')
    first('.bookmark').click_button('modify this!')
    expect(page).to have_content "Change the below link"
  end
end
