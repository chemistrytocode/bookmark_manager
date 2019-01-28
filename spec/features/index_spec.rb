feature 'Viewing bookmarks' do
  describe "Display all bookmarks" do
    scenario "Displays all bookmarks" do
      visit ('/bookmarks')
      expect(page).to have_content "https://www.google.com"
    end
  end
end
