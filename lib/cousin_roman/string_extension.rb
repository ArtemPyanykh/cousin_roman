require "cousin_roman/roman"

class String
  def to_arabic
    CousinRoman::Roman.to_arabic(self)
  end

  def to_arabic!
    CousinRoman::Roman.to_arabic!(self)
  end
end
