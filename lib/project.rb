class Word
  attr_reader :id, :spelling, :definition

  @@words = {}
  @@total_rows = 0

  def initialize(spelling, id, definition)
    @spelling = spelling
    @id = id || @@total_rows += 1
    @definition = definition

  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.spelling, self.id, self.definition)
  end

  def ==(word_to_compare)
    self.spelling() == word_to_compare.spelling()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

end
