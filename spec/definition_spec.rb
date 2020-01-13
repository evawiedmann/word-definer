require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new('Blah', nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as aother  definition") do
      definition = Definition.new("Naima", @word.id, nil)
      definition2 = Definition.new("Naima", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("Giat Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("Giat Steps", @word.id, nil)
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
      definition = Definition.new("Giat Steps", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Naima", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update_definition') do
    it("updates a definition by id") do
      definition = Definition.new("This means something", nil, nil)
      definition.save()
      definition.update_definition("This means something else")
      expect(definition.written).to(eq("This means something else"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new("Blah blah", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Nah nah", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('#definitions') do
      it("returns a word's definitions") do
        word = Word.new("Gone", 1)
        word.save()
        definition = Definition.new("This and that", 1, nil)
        definition.save()
        definition2 = Definition.new("Up and down", 1, nil)
        definition2.save()
        expect(word.definitions).to(eq([definition, definition2]))
      end
    end
end
