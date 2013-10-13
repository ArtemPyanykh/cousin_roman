require 'spec_helper'

describe CousinRoman::Arabian do
  describe 'valid?' do
    it 'should consider invalid numbers <= 0' do
      (-10..0).each do |number|
        CousinRoman::Arabian.valid?(number).should be_false
      end
    end

    it 'should consider valid numbers > 1 and <= 3999' do
      CousinRoman::Arabian.valid?(1).should be_true
      CousinRoman::Arabian.valid?(3999).should be_true
    end

    it 'should consider invalid numbers > 3999' do
      CousinRoman::Arabian.valid?(4000).should be_false
    end
  end


  describe 'convert' do
    1.upto(3999).each do |arabian|
      it "should succeed on #{arabian}", slow: true do
        roman = CousinRoman::Arabian.convert(arabian)
        CousinRoman::Roman.valid?(roman).should be_true
        CousinRoman::Roman.convert(roman).should == arabian
      end
    end
  end

  describe 'to_roman' do
    it 'should call convert on valid number' do
      CousinRoman::Arabian.should_receive(:convert).and_call_original
      CousinRoman::Arabian.to_roman(1).should == 'I'
    end

    it 'should return nil on invalid number' do
      CousinRoman::Arabian.to_roman(100500).should be_nil
    end
  end

  describe 'to_roman!' do
    it 'should call convert on valid number' do
      CousinRoman::Arabian.should_receive(:convert).and_call_original
      CousinRoman::Arabian.to_roman!(1).should == 'I'
    end

    it 'should throw TypeError on invalid number' do
      expect { CousinRoman::Arabian.to_roman!(100500) }.to raise_error(TypeError)
    end
  end
end
