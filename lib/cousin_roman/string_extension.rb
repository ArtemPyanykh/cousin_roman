require "cousin_roman/roman"

class String
  def to_arabian
    CousinRoman::Roman.to_arabian(self)
  end

  def to_arabian!
    CousinRoman::Roman.to_arabian!(self)
  end
end
