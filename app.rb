require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/song')
require('pry')
also_reload('lib/**/*.rb')

get('/test/') do
   @something = "this is a variable"
  erb(:whatever)
end

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  if params[:searchID]
    @words = [Word.find(params[:searchID].to_i())]
    # binding.pry
  elsif params[:searchName]
    @words = Word.search(params[:searchName])
  elsif params[:sorter]
    @words = Word.sorter
  else
    @words = Word.all
  end
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

post('/words') do
  spelling = params[:spelling]
  definition = params[:definition]
  word = Word.new(spelling, nil, definition)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  "This will take us to a page with a form for updating an word with an ID of #{params[:id]}."
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  if params[:spelling] != ""
    @word.update_spelling(params[:spelling])
  end
  if params[:definition] != ""
    @word.update_definition(params[:definition])
  end
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end

get('/words/:id/edit') do
  "This will take us to a page with a form for updating an word with an ID of #{params[:id]}."
end

# Get the detail for a specific song such as lyrics and songwriters.
get('/words/:id/songs/:song_id') do
  @song = Song.find(params[:song_id].to_i())
  erb(:song)
end

# Post a new song. After the song is added, Sinatra will route to the view for the word the song belongs to.
post('/words/:id/songs') do
  @word = Word.find(params[:id].to_i())
  song = Song.new(params[:song_spelling], @word.id, nil)
  song.save()
  erb(:word)
end

# Edit a song and then route back to the word view.
patch('/words/:id/songs/:song_id') do
  @word = Word.find(params[:id].to_i())
  song = Song.find(params[:song_id].to_i())
  song.update(params[:spelling], @word.id)
  erb(:word)
end

# Delete a song and then route back to the word view.
delete('/words/:id/songs/:song_id') do
  song = Song.find(params[:song_id].to_i())
  song.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
