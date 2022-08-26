# frozen_string_literal: true

require './lib/caesar'


describe '#get_message' do
  it 'returns a lowercase message' do
    expect(get_message('STRINGY MCSTRINGFACE')).to eql('stringy mcstringface'))
  end

  it 'returns a lowercase message with non-alphabetic characters' do
    expect(get_message('NICE TO MEET YOU STRING, I\'M DAD')).to eql('nice to meet you string, i\'m dad')
  end
end

# Is message punctuation left unencrypted?
it 'returns a message that leaves punctuation unencrypted' do
  expect(get_message('Wow, what a string!')).to eql('Btb, bmfy f xywnsl!')

# is the shift an integer? not a string
  # expect(get_shift('1').to eql(1))
# is the integer in the range of 1..25?
