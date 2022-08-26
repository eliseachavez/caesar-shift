# frozen_string_literal: true

require './lib/caesar'

# is the message lowercase?
describe '' do
  it 'returns a message that is a lowercase string' do
  expect(get_message('What a string').to eql('Bmfy f xywnsl'))
  end
end

# is punctuation left unencrypted?

# is the shift an integer? not a string
  # expect(get_shift('1').to eql(1))
# is the integer in the range of 1..25?
