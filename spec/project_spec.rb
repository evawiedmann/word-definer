require('rspec')
require('project')

describe '#Word' do

  before(:each)do
  Word.clear()
end

describe("#save") do
  it('saves word')do
  word = Word.new('Blue', nil, 'definition')
  word.save()
  expect(Word.all).to(eq([word]))
end
end
describe ('.all') do
  it('is empty')do
  expect(Word.all()).to(eq([]))
end
end
describe('.clear') do
    it('clears all words') do
      word = Word.new('Blue', nil, 'definition')
      word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end
end
