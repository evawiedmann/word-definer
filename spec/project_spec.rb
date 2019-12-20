require('rspec')
require('project')

describe '#Word' do

  before(:each)do
  Word.clear()
  end

  describe("#save") do
    it('saves word')do
    word = Word.new('Red', nil, 'definition')
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
      word = Word.new('Red', nil, 'definition')
      word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end
  describe('#==') do
    it('is the same word if it has the same attributes as another word') do
      word = Word.new('Red', nil, 'definition')
      word2 = Word.new('Red', nil, 'definition')
      expect(word).to(eq(word2))
    end
  end
  describe('#update_spelling') do
    it('updates the spelling of a word by id') do
    word = Word.new('Redd', nil, 'definition')
    word.save()
    word.update_spelling('Red')
    expect(word.spelling).to(eq('Red'))
  end
end

describe('#delete') do
    it("deletes an word by id") do
      word = Word.new("Giant Steps", nil, "1989", "Fred")
      word.save()
      word2 = Word.new("Blue", nil, "1992", "Bob")
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
end
