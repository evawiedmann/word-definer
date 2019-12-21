require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/definition')
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
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

# get('/custom_route') do
#   "We can even create custom routes, but we should only do this when needed."
# end

get('/words/:id/edit') do
  "This will take us to a page with a form for updating an word with an ID of #{params[:id]}."
end

get('/words/:id/words/:definiton_id') do
  @definiton = Definition.find(params[:definiton_id].to_i())
  erb(:definiton)
end

post('/words/:id/words') do
  @word = Word.find(params[:id].to_i())
  definiton = Definition.new(params[:definiton_spelling], @word.id, nil)
  definiton.save()
  erb(:word)
end

patch('/words/:id/words/:definiton_id') do
  @word = Word.find(params[:id].to_i())
  definiton = Definition.find(params[:definiton_id].to_i())
  definiton.update(params[:spelling], @word.id)
  erb(:word)
end

delete('/words/:id/words/:definiton_id') do
  definiton = Definition.find(params[:definiton_id].to_i())
  definiton.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
