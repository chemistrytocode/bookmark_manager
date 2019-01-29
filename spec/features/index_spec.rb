require 'pg'

feature 'Testing infrastructure' do
    scenario 'It should visit main page and display hello world.' do
    visit ('/')
    expect(page).to have_content "Hello, world."
  end
end

feature 'Adding bookmarks' do
  scenario 'I am able to add a bookmark' do
    visit('/bookmarks')
    fill_in('url', with: 'www.tesco.com')
    click_button('Add Bookmark')
    expect(page).to have_content "www.tesco.com"
  end
end



feature 'Viewing bookmarks' do
    scenario "Displays all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
        # Add the test data
        connection.exec("INSERT INTO bookmarks (url) VALUES ('www.google.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('www.yahoo.com');")

        visit('/bookmarks')

        expect(page).to have_content('www.google.com')
        expect(page).to have_content('www.yahoo.com')
    end
  end
