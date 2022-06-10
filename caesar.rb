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

def get_shift
  puts "Enter the shift"
  shift = gets.chomp.to_i
  if shift.is_a?(Integer)
    shift
  else
    "That was not a valid shift"
  end
end

def encrypt(mesg_arr, shift)
  mesg_arr.map do |item|
    if @letters.include?(item)
      if item.upcase == item
        item = item.downcase
        num_mesg = to_num(item)
        shifted_mesg = shift_num(num_mesg, shift)
        encr_mesg = to_str(shifted_mesg)
        encr_mesg = encr_mesg.upcase
      else #it's lowercase
        num_mesg = to_num(item)
        shifted_mesg = shift_num(num_mesg, shift)
        encr_mesg = to_str(shifted_mesg)
      end
    else
      item
    end
  end
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
# MAIN ###########
puts "Enter a message"
message = gets.chomp
shift = get_shift

# Convert string to characters, characters to numbers
mesg_arr = message.split('')
encrypted_mesg = encrypt(mesg_arr, shift)
encrypted_mesg = encrypted_mesg.join("")
# is is punctuation? leave it alone?
# is it uppercase? note that
# look up number equivalency
# subtract shift (wrap from 0 to 26 instead of going negative)
# convert back to a letter using lookup
