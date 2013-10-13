require "cousin_roman/version"
require "cousin_roman/roman"
require "cousin_roman/arabian"
require "cousin_roman/string_extension"
require "cousin_roman/integer_extension"

module CousinRoman
  LITERALS = [
    'i', 'I',
    'v', 'V',
    'x', 'X',
    'l', 'L',
    'c', 'C',
    'd', 'D',
    'm', 'M'
  ]

  ONES = {
    'i' => 1,
    'x' => 10,
    'c' => 100,
    'm' => 1000
  }

  FIVES = {
    'v' => 5,
    'l' => 50,
    'd' => 500,
  }

  SUBTRACTIVES = {
    'iv' => 4,
    'ix' => 9,
    'xl' => 40,
    'xc' => 90,
    'cd' => 400,
    'cm' => 900,
  }

  FACTORS = ONES.merge(FIVES).merge(SUBTRACTIVES)
end
