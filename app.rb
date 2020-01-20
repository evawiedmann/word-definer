require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
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
  written = params[:word_name]
  definition = params[:definition_name]
  word = Word.new(written, definition)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:name].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update_written(params[:written])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

get('/words/:id/words/:definition_id') do
  @definiton = Definition.find(params[:definiton_id].to_i())
  erb(:definiton)
end

post('/words/:id/words') do
  @word = Word.find(params[:id].to_i())
  definiton = Definition.new(params[:definiton_written], @word.id, nil)
  definiton.save()
  erb(:word)
end

patch('/words/:id/definitions/:definiton_id') do
  @word = Word.find(params[:id].to_i())
  definiton = Definition.find(params[:definiton_id].to_i())
  definiton.update(params[:written], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  definiton = Definition.find(params[:definiton_id].to_i())
  definiton.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
