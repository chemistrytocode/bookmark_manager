require 'pg'

feature 'Testing infrastructure' do
    scenario 'It should visit main page and display hello world.' do
    visit ('/')
    expect(page).to have_content "Hello, world."
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
