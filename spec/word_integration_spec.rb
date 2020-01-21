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

  it ('allows a user to edit the definition(s) of a word') do
    word = Word.new('Zip', nil)
    word.save
    id = word.id
    visit "/words/#{id}"
    click_link('Edit Word')
    fill_in('name', :with => 'A quick noise.')
    click_on('Update')
    click_link('A quick noise.')
    fill_in('definition_name', :with => 'A speedy event.')
    click_button('Add definition')
    expect(page).to have_content('A speedy event.')
  end
end
