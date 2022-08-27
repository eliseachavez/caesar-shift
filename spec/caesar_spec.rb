# frozen_string_literal: true

require './lib/caesar'
describe 'Cipher' do
  describe '#shift' do
    it 'returns an integer' do
      cipher = Cipher.new
      expect(cipher.shift.is_a?(Integer)).to eql(true)
    end
  end

  describe '#message' do
    it 'returns a lowercase message' do
      cipher = Cipher.new
      cipher.encrpt_msg = 'STRINGY MCSTRINGFACE'
      expect(cipher.correct_case).to eql('stringy mcstringface')
    end

    it 'returns a lowercase message with non-alphabetic characters' do
      cipher = Cipher.new
      cipher.encrpt_msg = 'NICE TO MEET YOU STRING, I\'M DAD'
      expect(cipher.correct_case).to eql('nice to meet you string, i\'m dad')
    end
  end

#   describe '#convert_to_array' do
#     it 'returns an array of characters' do
#       cipher = Cipher.new
#       cipher.msg = 'hi, friend!'
#       cipher.convert_to_array
#       expect(cipher.msg).to eql(['h', 'i', ',', '', 'f', 'r', 'i', 'e', 'n', 'd', '!'])
#     end
#   end

# # Is message encrypted?

# # it 'returns a simple letter-only message encrypted with proper shift' do
# #   expect('mom and dad').to eql('rtr tsi ifi')
# # end

# # it 'returns an encrypted message where punctuation stays unencrypted' do
# #   expect('i\'m dad, son.').to eql('m\'s ifi, xts.')
# # end

# # it 'returns an encrypted message where numbers stay unencrypted' do
# #   expect('1 great mom').to eql('1 lwjfy rtr')
# # end

# # it 'returns an encrypted message where non-punctuation, non-numbers, and non-alphabetic characters are unencrypted' do
# #   expect('#@mom$~').to eql('#@rtr$~')
# # end
# # it 'returns a message that leaves punctuation unencrypted' do
# #   expect(get_message('Wow, what a string!')).to eql('Btb, bmfy f xywnsl!')

# # is the shift an integer? not a string
#   # expect(get_shift('1').to eql(1))
# # is the integer in the range of 1..25?
end
