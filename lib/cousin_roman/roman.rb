module CousinRoman
  module Roman
    extend self

    def valid?(number)
      matches = number.match roman_regex
      matches and !matches[0].empty?
    end

    # Convert Roman +number+ represented as a string to an Integer.
    #
    # It is essential that +numer+ is a valid Roman numeral.
    #
    # The steps are:
    #
    # 1. Replace factors with their numeric values
    # starting from subtractive factors (cause they are compound).
    # 2. Sum this numeric values to get the final answer
    def convert(number)
      intermediate = number.dup.downcase
      SUBTRACTIVES.each do |factor, value|
        intermediate.gsub!(factor, "(#{value})")
      end
      ONES.merge(FIVES).each do |factor, value|
        intermediate.gsub!(factor, "(#{value})")
      end

      intermediate.scan(/\((\d*)\)/).reduce(0) do |sum, term|
        sum + term.first.to_i
      end
    end

    def to_arabian(number)
      clean = number.strip
      convert clean if valid? clean
    end

    def to_arabian!(number)
      clean = number.strip
      if valid? clean
        convert clean
      else
        raise TypeError, 'not a valid roman number'
      end
    end

    def roman_regex
      /^(M{0,3})(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/i
    end
  end
end
