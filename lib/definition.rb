class Definition
  attr_reader :written, :word_id, :id

  @@definitions = {}
  @@total_rows = 0

  def initialize(written, word_id, id)
    @written = written
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(definition_to_compare)
    self.written() == definition_to_compare.written() && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.written, self.word_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def update_definition(written)
    @written = written
    @@definitions[self.id] = Definition.new(self.written, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find_by_name(test_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == test_id
        definitions.push(definition)
      end
    end
    definitions
  end
end
