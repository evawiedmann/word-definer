require('rspec')
require('project')

describe '#Word' do

  describe("#save") do
    it('saves word')do
    word = Words.new('Grass', nil, 'definition') # nil added as second argument
    word.save()
    expect(Words.all).to(eq([word]))
  end


end
end
