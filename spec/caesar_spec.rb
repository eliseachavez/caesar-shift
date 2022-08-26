# frozen_string_literal: true

require './lib/caesar'

describe '#get_message' do
  it 'returns a lowercase message' do
    msg = get_message
    expect(get_message).to eql(get_message.chomp)
  end
  it 'returns a lowercase message with non-alphabetic characters' do
    expect(get_message('NICE TO MEET YOU STRING, I\'M DAD')).to eql('nice to meet you string, i\'m dad')
  end
end

describe '#convert_to_array' do
  it 'returns an array of characters' do
    expect(convert_to_array('hi, friend!')).to eql(['h', 'i', ',', '', 'f', 'r', 'i', 'e', 'n', 'd', '!'])
  end
end

# Is message punctuation left unencrypted?
it 'returns an encrypted message where punctuation stays unencrypted' do
  expect('i\'m dad, son.').to eql('m\'s ifi, xts.')
end

it 'returns an encrypted message where numbers stay unencrypted' do
  expect('1 great mom').to eql('1 lwjfy rtr')
end

it 'returns an encrypted message where non-punctuation, non-numbers, and non-alphabetic characters are unencrypted' do
  expect('#@mom$~').to eql('#@rtr$~')
end
# it 'returns a message that leaves punctuation unencrypted' do
#   expect(get_message('Wow, what a string!')).to eql('Btb, bmfy f xywnsl!')

# is the shift an integer? not a string
  # expect(get_shift('1').to eql(1))
# is the integer in the range of 1..25?
