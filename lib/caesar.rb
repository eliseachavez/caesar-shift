# frozen_string_literal: true

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
@letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

# METHODS #################
class Cipher
  attr_accessor :msg, :shift
  def initialize
    begin_encryption_steps
  end

  def begin_encryption_steps
    get_message
    get_shift
    convert_to_array
    parse
    encrypt
    @msg.join('')
    print_msg
  end

  def get_shift
    puts "Enter the shift"
    @shift = gets.chomp.to_i
  end

  def get_message()
    puts "Enter a message"
    @msg = gets.chomp
  end

  def parse
    @msg.downcase
  end

  def encrypt
    mesg_arr.map do |char|
      num_mesg = to_num(item)
      shifted_mesg = shift_num(num_mesg, shift)
      encr_mesg = to_str(shifted_mesg)
    end
  end

  def convert_to_array
    @msg.split('')
  end

  def to_num(item)
    item = @alphabet[item.to_sym]
  end

  def shift_num(num_mesg, shift)
    num_mesg = num_mesg - shift
    if num_mesg < 0
      num_mesg = 25 + num_mesg
    else
      num_mesg
    end
  end

  def to_str(shifted_mesg)
    new_alphabet = @alphabet.invert
    new_mesg = new_alphabet[shifted_mesg]
    new_mesg = new_mesg.to_s
  end

  def print_msg
    p @msg
  end
end

# MAIN ###########
caesar_cipher = Cipher.new

