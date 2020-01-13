require 'rspec'
require 'definition'
require 'project'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new('Blah', nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another  definition") do
      definition = Definition.new("Naima", @word.id, nil)
      definition2 = Definition.new("Naima", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("Naima", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new("Naima", @word.id, nil)
      definition.save()
      definition.update("Mr. P.C.", @word.id)
      expect(definition.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition = Definition.new("Giant Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for an word") do
      word2 = Word.new("Blue", nil, "1989", "Bill")
      word2.save
      definition = Definition.new("Naima", @word.id, nil)
      definition.save()
      definition2 = Definition.new("California", word2.id , nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#definitions') do
      it("returns an word's definitions") do
        word = Word.new("Giant Steps", nil, "1990", "Fred")
        word.save()
        definition = Definition.new("Naima", word.id, nil)
        definition.save()
        definition2 = Definition.new("Cousin Mary", word.id, nil)
        definition2.save()
        expect(word.definitions).to(eq([definition, definition2]))
      end
    end

    describe('#word') do
      it("finds the word a definition belongs to") do
        definition = Definition.new("Naima", @word.id, nil)
        definition.save()
        expect(definition.word()).to(eq(@word))
      end
    end
end
