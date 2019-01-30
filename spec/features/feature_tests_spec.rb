require 'pg'

feature 'Testing infrastructure' do
    scenario 'It should visit main page and display hello world.' do
    visit ('/')
    expect(page).to have_content "Hello!"
  end
end

feature 'Adding bookmarks' do
  scenario 'I can add a bookmark to the Bookmark Manager' do
    visit('/bookmarks')
    fill_in('url', with: 'www.tesco.com')
    fill_in('title', with: 'Tesco')
    click_button('create Bookmark')
    expect(page).to have_link("Tesco", href: "www.tesco.com")
  end
end



feature 'Viewing bookmarks' do
    scenario "Displays all bookmarks" do
      Bookmark.create(url: "www.google.com", title: "Google")
      Bookmark.create(url: "www.yahoo.com", title: "Yahoo")
      visit('/bookmarks')
      expect(page).to have_link("Google", href: "www.google.com")
      expect(page).to have_link("Yahoo", href: "www.yahoo.com")
    end
  end

feature 'Deleting bookmarks' do
  scenario "Delete selected bookmarks" do
    Bookmark.create(url: "https://www.yahoo.com", title: "Yahoo")
    Bookmark.create(url: "www.google.com", title: "Google")
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
