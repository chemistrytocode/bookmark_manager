feature 'Testing infrastructure' do
  describe 'Hello world (index)' do
    scenario 'It should visit main page and display hello world.' do
    visit ('/')
    expect(page).to have_content "Hello!"
    end
  end
end
