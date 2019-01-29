feature 'Viewing bookmarks' do
  describe "Display all bookmarks" do
    scenario "Displays all bookmarks" do
      visit ('/bookmarks')
      expect(page).to_not have_content "BACKTRACE"
      expect(page).to have_content "www.google.com"
    end
  end
end
