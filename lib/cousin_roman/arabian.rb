require 'cousin_roman'

module CousinRoman
  module Arabian
    extend self

    def valid?(number)
      number.is_a? Integer and number >= 1 and number <= 3999
    end

    def to_roman(arabian)
      convert arabian if valid? arabian
    end

    def to_roman!(arabian)
      if valid? arabian
        convert arabian
      else
        raise TypeError, 'not a valid roman number'
      end
    end

    def convert(number)
      thousands = number / 1000
      hundreds = number / 100 % 10
      tens = number / 10 % 10
      ones = number % 10

      build_roman(thousands, hundreds, tens, ones).upcase
    end

    def build_roman(thousands, hundreds, tens, ones)
      build_pow(thousands, 4) +
      build_pow(hundreds, 3) +
      build_pow(tens, 2) +
      build_pow(ones, 1)
    end

    def build_pow(number, pow)
      literals = pow_literals(pow)

      case number
      when 1..3 then literals[:one]*number
      when 4 then literals[:subtractives][4]
      when 5..8 then literals[:five] + (literals[:one]*(number - 5))
      when 9 then literals[:subtractives][9]
      else ""
      end
    end

    def pow_literals(pow)
      one_literal, _ = ONES.find do |literal, value|
        value >= 10 ** (pow - 1) and value < 10 ** pow
      end
      five_literal, _ = FIVES.find do |literal, value|
        value >= 10 ** (pow - 1) and value < 10 ** pow
      end
      subtractive_literals = {}
      SUBTRACTIVES.select do |literal, value|
        value >= 10 ** (pow - 1) and value < 10 ** pow
      end.each do |literal, number|
        order = number / (10 ** (pow - 1))
        subtractive_literals[order] = literal
      end

      {one: one_literal, five: five_literal, subtractives: subtractive_literals}
    end
  end
end
