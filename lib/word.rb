class Word
  attr_reader :id, :spelling

  @@words = {}
  @@total_rows = 0

  def initialize(spelling, id)
    @spelling = spelling
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.spelling, self.id)
  end

  def ==(word_to_compare)
    self.spelling() == word_to_compare.spelling()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def update_spelling(spelling)
    @spelling = spelling
  end

  def delete
    @@words.delete(self.id)
  end

  def definitons
  Definiton.find_by_spelling(self.id)
  end

end
