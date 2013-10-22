module CousinRoman
  module StringExtension
    def to_arabian
      CousinRoman::Roman.to_arabian(self)
    end

    def to_arabian!
      CousinRoman::Roman.to_arabian!(self)
    end
  end
end

class String
  include CousinRoman::StringExtension
end
