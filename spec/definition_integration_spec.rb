require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a definiton path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("Yellow", nil)
    word.save()
    visit("/words/#{word.id}/definitions/")
    fill_in('definition_name', :with => 'Love')
    click_on('Add definition')
    expect(page).to have_content('Love')
  end
end
