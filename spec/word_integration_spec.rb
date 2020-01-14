require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creates a word path', {:type => :feature}) do
  it('creates a word and then goes to the all words page') do
    visit('/words')
    click_on('Add a word')
    fill_in('word_name', :with => 'Yellow')
    fill_in('definition_name', :with => 'primary color, not red or blue')
    click_on('Go!')
    expect(page).to have_content('Yellow')
  end
end
