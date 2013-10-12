require "cousin_roman/conversion"

class String
  def to_arabic
    CousinRoman.to_arabic
  end

  def to_arabic!
    CousinRoman.to_arabic!
  end
end
