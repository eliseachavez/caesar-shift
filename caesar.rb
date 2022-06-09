require 'pry-byebug'
# GLOBAL VARIABLES ############

alphabet = {
  a: 1,
  b: 2,
  c: 3,
  d: 4,
  e: 5,
  f: 6,
  g: 7,
  h: 8,
  i: 9,
  j: 10,
  k: 11,
  l: 12,
  m: 13,
  n: 14,
  o: 15,
  p: 16,
  q: 17,
  r: 18,
  s: 19,
  t: 20,
  u: 21,
  v: 22,
  w: 23,
  x: 24,
  y: 25,
  z: 26
}
is_down = true

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
# MAIN ###########
puts "Enter a message"
message = gets.chomp
shift = get_shift

# Convert string to characters, characters to numbers
mesg_arr = message.split('')
binding.pry
# is is punctuation? leave it alone?
# is it uppercase? note that
# look up number equivalency
# subtract shift (wrap from 0 to 26 instead of going negative)
# convert back to a letter using lookup





