class Word
  attr_reader :id, :name, :definition

  @@words = {}
  @@total_rows = 0

  def initialize(name, id, definition)
    @name = name
    @id = id || @@total_rows += 1
    @definition = definition

  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id, self.definition)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

end
