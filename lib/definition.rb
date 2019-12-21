class Definition
  attr_reader :id
  attr_accessor :spelling, :word_id

  @@definitons = {}
  @@total_rows = 0

  def initialize(spelling, word_id, id)
    @spelling = spelling
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(definiton_to_compare)
    self.spelling() == definiton_to_compare.spelling() && (self.word_id() == definiton_to_compare.word_id())
  end

  def self.all
    @@definitons.values
  end

  def save
    @@definitons[self.id] = Definition.new(self.spelling, self.word_id, self.id)
  end

  def self.find(id)
    @@definitons[id]
  end

  def update(spelling, word_id)
    self.spelling = spelling
    self.word_id = word_id
    @@definitons[self.id] = Definition.new(self.spelling, self.word_id, self.id)
  end

  def delete
    @@definitons.delete(self.id)
  end

  def self.clear
    @@definitons = {}
  end

  def self.find_by_album(alb_id)
    definitons = []
    @@definitons.values.each do |definiton|
      if definiton.word_id == alb_id
        definitons.push(definiton)
      end
    end
    definitons
  end

  def album
    Album.find(self.word_id)
  end
end
