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
       valid? arabian or raise TypeError, 'not a valid roman number'
       convert arabian
    end

    def convert(number)
      thousands = number / 1000
      hundreds = number / 100 % 10
      tens = number / 10 % 10
      ones = number % 10

      build_roman(thousands, hundreds, tens, ones).upcase
    end

    def build_roman(thousands, hundreds, tens, ones)
      build_pow(thousands, 3) +
      build_pow(hundreds, 2) +
      build_pow(tens, 1) +
      build_pow(ones, 0)
    end

    def build_pow(number, pow)
      literals = CousinRoman.literals_for_pow pow

      case number
      when 1..3 then literals[:one]*number
      when 4 then literals[:subtractives][4]
      when 5..8 then literals[:five] + (literals[:one]*(number - 5))
      when 9 then literals[:subtractives][9]
      else ""
      end
    end
  end
end
