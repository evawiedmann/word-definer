require('rspec')
require('word')

describe '#Word' do

  before(:each)do
  Word.clear()
  end

  describe("#save") do
    it('saves word')do
    word = Word.new('Red', nil)
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
      word = Word.new('Red', nil)
      word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end
  describe('#==') do
    it('is the same word if it has the same attributes as aother word') do
      word = Word.new('Red', nil)
      word2 = Word.new('Red', nil)
      expect(word).to(eq(word2))
    end
  end
  describe('#update_name') do
    it('updates the spelling of a word by id') do
    word = Word.new('Redd', nil)
    word.save()
    word.update_name('Red')
    expect(word.name).to(eq('Red'))
  end
end

describe('#delete') do
    it("deletes a word by id") do
      word = Word.new('Red', nil)
      word.save()
      word2 = Word.new('Tall', nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
end
