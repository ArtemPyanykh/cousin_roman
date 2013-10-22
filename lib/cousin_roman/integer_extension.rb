module CousinRoman
  module IntegerExtension
    def to_roman
      CousinRoman::Arabian.to_roman(self)
    end

    def to_roman!
      CousinRoman::Arabian.to_roman!(self)
    end
  end
end

class Integer
  include CousinRoman::IntegerExtension
end
