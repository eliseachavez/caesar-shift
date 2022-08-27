# frozen_string_literal: true

require './lib/caesar'

describe 'Cipher' do
  describe '#shift' do
    xit 'returns an integer' do
      cipher = Cipher.new
      expect(cipher.shift.is_a?(Integer)).to eql(true)
    end
  end

  describe '#message' do
    xit 'returns a lowercase message' do
      cipher = Cipher.new
      cipher.encrpt_msg = 'STRINGY MCSTRINGFACE'
      expect(cipher.correct_case).to eql('stringy mcstringface')
    end

    xit 'returns a lowercase message with non-alphabetic characters' do
      cipher = Cipher.new
      cipher.encrpt_msg = 'NICE TO MEET YOU STRING, I\'M DAD'
      expect(cipher.correct_case).to eql('nice to meet you string, i\'m dad')
    end
  end

  describe '#encrypt' do
    xit 'returns a simple letter-only message encrypted with proper shift' do
      cipher = Cipher.new
      cipher.msg = 'mom and dad'
      cipher.encrpt_msg = 'mom and dad'
      cipher.shift = 5
      cipher.begin_encryption_steps
      expect(cipher.encrpt_msg).to eql('rtr fsi ifi')
    end

    xit 'returns an encrypted message where punctuation stays unencrypted' do
      cipher = Cipher.new
      cipher.msg = 'i\'m dad, son.'
      cipher.encrpt_msg = 'i\'m dad, son.'
      cipher.shift = 5
      cipher.begin_encryption_steps
      expect(cipher.encrpt_msg).to eql('n\'r ifi, xts.')
    end

    xit 'returns an encrypted message where numbers stay unencrypted' do
      cipher = Cipher.new
      cipher.msg = '1 great mom'
      cipher.encrpt_msg = '1 great mom'
      cipher.shift = 5
      cipher.begin_encryption_steps
      expect(cipher.encrpt_msg).to eql('1 lwjfy rtr')
    end

    xit 'returns an appropriate encryption when a shift over 26 is used' do
      cipher = Cipher.new
      cipher.msg = 'hi'
      cipher.encrpt_msg = 'hi'
      cipher.shift = 42 # 42 % 25 is 17,
      cipher.begin_encryption_steps
      expect(cipher.encrpt_msg).to eql('yz')
    end

    xit 'returns an appropriate encryption when a shift that is smaller than 25 and negative is used' do
      cipher = Cipher.new
      cipher.msg = 'hi' # 78, si 23
      cipher.encrpt_msg = 'hi'
      cipher.shift = -5 # would be a shift of 5 in other direction?
      cipher.begin_encryption_steps
      expect(cipher.encrpt_msg).to eql('cd')
    end

    xit 'returns an appropriate encryption when a shift that is larger than 26 and negative is used' do
      cipher = Cipher.new
      cipher.msg = 'ah' # 07  becomes 25-6, so 'zg'
      cipher.encrpt_msg = 'ah'
      cipher.shift = -26 # modulo 25, that's -1, so 67
      cipher.begin_encryption_steps
      expect(cipher.encrpt_msg).to eql('zg')
    end

    xit 'returns the same message when the shift is zero' do
      cipher = Cipher.new
      cipher.msg = 'hi'
      cipher.encrpt_msg = 'hi'
      cipher.shift = 0
      cipher.begin_encryption_steps
      expect(cipher.encrpt_msg).to eql('hi')
    end

    it 'returns an encrypted message where non-punctuation, non-numbers, and non-alphabetic characters are unencrypted' do
      cipher = Cipher.new
      cipher.msg = '#@mom$~' # 13 15 13 to 18 20 18
      # not 22 24 22
      # from 17 19 17
      cipher.encrpt_msg = '#@mom$~'
      cipher.shift = 5
      cipher.begin_encryption_steps
      expect(cipher.encrpt_msg).to eql('#@rtr$~')
    end
      # # it 'returns a message that leaves punctuation unencrypted' do
      # #   expect(get_message('Wow, what a string!')).to eql('Btb, bmfy f xywnsl!')

      # # is the shift an integer? not a string
      #   # expect(get_shift('1').to eql(1))
      # # is the integer in the range of 1..25?
  end
end
