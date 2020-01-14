class Word
  attr_reader :id, :name

  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def update_name(name)
    @name = name
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
  Definition.find_by_name(self.id)
  end

end
