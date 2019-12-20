require('rspec')
require('project')

describe '#Word' do

  before(:each)do
  Word.clear()
end

describe("#save") do
  it('saves word')do
  word = Word.new('Grass', nil, 'definition')
  word.save()
  expect(Word.all).to(eq([word]))
end


end
end
