require "cousin_roman/roman"

class Integer
  def to_roman
    CousinRoman::Arabian.to_roman(self)
  end

  def to_roman!
    CousinRoman::Arabian.to_roman!(self)
  end
end
