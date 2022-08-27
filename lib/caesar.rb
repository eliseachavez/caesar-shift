# frozen_string_literal: true

# Class that takes a message and encrypts as a caesar cipher shift
class Cipher
  attr_accessor :msg, :encrpt_msg, :shift

  def initialize
    @alphabet = {
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6,
      h: 7,
      i: 8,
      j: 9,
      k: 10,
      l: 11,
      m: 12,
      n: 13,
      o: 14,
      p: 15,
      q: 16,
      r: 17,
      s: 18,
      t: 19,
      u: 20,
      v: 21,
      w: 22,
      x: 23,
      y: 24,
      z: 25
    }
    @msg = nil
    @encrpt_msg = nil
    @shift = nil
    @temp_shift = nil
    @numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

    initialization_steps
    begin_encryption_steps
  end

  def initialization_steps
    get_message
    get_shift
  end

  def begin_encryption_steps
    parse
    encrypt
    numbers_back_to_letters
    print_msg
  end

  def get_shift
    puts 'Enter the shift'
    shift = gets.chomp.to_i
    @temp_shift = shift
    @shift = shift
  end

  def get_message
    puts 'Enter a message'
    msg = gets.chomp
    @encrpt_msg = msg
    @msg = msg
  end

  def parse
    correct_case
    convert_all_to_numbers
  end

  def encrypt
    @encrpt_msg.map! do |char|
      shift_char(char)
    end
  end

  def correct_case
    @encrpt_msg.downcase
  end

  def convert_all_to_numbers
    temp_msg = @encrpt_msg.split('')
    temp_msg.map! do |char|
      if @alphabet.include?(char.to_sym)
        @alphabet[char.to_sym]
      else
        char
      end
    end
    @encrpt_msg = temp_msg
  end

  def shift_char(char)
    if char.is_a?(Integer)
      char = @shift >= 0 ? pos_shift(char) : neg_shift(char)
    end
    char
  end

  def pos_shift(char)
    @temp_shift %= 25 unless @temp_shift.zero?
    char += @temp_shift
    char
  end

  def neg_shift(char)
    @temp_shift = shift.dup
    if @temp_shift.abs > 25 #07 becomes 25-6
      @temp_shift = @temp_shift.abs
      @temp_shift %= 25 # 26 modulo 25 is 1
      @temp_shift = -@temp_shift # shift if -1
      char = wrap_shift(char) # if char is 7, this is now 6. so 78 becomes 67
    else
      char = wrap_shift(char)
    end
    char
  end

  def wrap_shift(char)
    # char is 7, shift is -1
    wrap_difference = nil
    if char < @temp_shift.abs
      wrap_difference = @temp_shift.abs - char
      char = 26 - wrap_difference
    else
      char += @temp_shift
    end
    char
  end

  def numbers_back_to_letters
    inverted_alphabet = @alphabet.invert
    @msg = @msg.split('')
    @msg.each_with_index do |char, idx|
      @encrpt_msg.each_with_index do |e_char, e_idx|
        next unless idx == e_idx

        @encrpt_msg[idx] = (inverted_alphabet[e_char.to_i]).to_s if @letters.include?(char)
      end
    end
    @encrpt_msg = @encrpt_msg.join('')
    @msg = @msg.join('')
  end

  def print_msg
    puts "The original message was #{@msg} and the new encrypted message is #{@encrpt_msg}"
  end
end

# MAIN ###########
Cipher.new

