require 'spec_helper'

describe CousinRoman::Roman do
  describe 'valid?' do
    describe 'literals validation' do
      ASCII = 0.upto(127).map(&:chr)
      NON_ROMAN_LITERALS = ASCII - CousinRoman::LITERALS

      CousinRoman::LITERALS.each do |l|
        it "should allow #{l}" do
          CousinRoman::Roman.valid?(l).should be_true
        end
      end

      NON_ROMAN_LITERALS.each do |l|
        it "should not allow #{l}" do
          CousinRoman::Roman.valid?(l).should be_false
        end
      end

      it 'should not allow mix of allowed and disallowed literals' do
        CousinRoman::Roman.valid?('MYCXI').should be_false
      end

      it 'should not allow empty string' do
        CousinRoman::Roman.valid?('').should be_false
      end
    end

    describe 'factors validation' do
      CousinRoman::ONES.keys.each do |factor|
        1.upto(3).each do |reps|
          it "should allow #{reps} repetitions of #{factor}" do
            CousinRoman::Roman.valid?(factor*reps).should be_true
          end
        end

        it "should not allow more than 3 repetitions of #{factor}" do
          CousinRoman::Roman.valid?(factor*4).should be_false
        end
      end

      CousinRoman::FIVES.merge(CousinRoman::SUBTRACTIVE).keys.each do |factor|
        it "should not allow repetition of #{factor}" do
          CousinRoman::Roman.valid?(factor*2).should be_false
        end
      end

      it 'should allow ones and fives of the same power' do
        CousinRoman::FIVES.keys.each_with_index do |five, index|
          1.upto(3).each do |reps|
            corresponding_one = CousinRoman::ONES.keys[index]
            CousinRoman::Roman.valid?(five + (corresponding_one * reps)).should be_true
          end
        end
      end

      it 'should not allow subtractives and ones or fives of the same power' do
        CousinRoman::Roman.valid?('ivi').should be_false
        CousinRoman::Roman.valid?('ixi').should be_false
        CousinRoman::Roman.valid?('xlx').should be_false
        CousinRoman::Roman.valid?('xcx').should be_false
        CousinRoman::Roman.valid?('cdc').should be_false
        CousinRoman::Roman.valid?('cmc').should be_false

        CousinRoman::Roman.valid?('ivv').should be_false
        CousinRoman::Roman.valid?('ixv').should be_false
        CousinRoman::Roman.valid?('xll').should be_false
        CousinRoman::Roman.valid?('xcl').should be_false
        CousinRoman::Roman.valid?('cdd').should be_false
        CousinRoman::Roman.valid?('cmd').should be_false
      end
    end

    describe 'ordering validation' do
      context 'when validating that factors are ordered by descreasing of power' do
        ORDERINGS_RIGHT = [
          'md', 'mc',
          'cl', 'cx',
          'xv', 'xi',
          'mcm', 'mcd',
          'cxc', 'cxl',
          'xix', 'xiv'
        ]
        ORDERINGS_WRONG = [
          'dm', 'lc', 'vx',
          'cmm', 'cdm',
          'xcc', 'xlc',
          'ixx', 'ivx'
        ]

        ORDERINGS_RIGHT.each do |pair|
          high, low = pair.split('', 2)
          it "should allow #{high}#{low}" do
            CousinRoman::Roman.valid?(high + low).should be_true
          end
        end

        ORDERINGS_WRONG.each do |pair|
          low, high = pair.split('', 2)
          it "should not allow #{low}#{high}" do
            CousinRoman::Roman.valid?(low + high).should be_false
          end
        end
      end
    end
  end

  describe 'convert' do
    context 'singular factors' do
      CousinRoman::FACTORS.each do |factor, number|
        it "should convert #{factor} to #{number}" do
          CousinRoman::Roman.convert(factor).should == number
        end
      end
    end

    context 'repetitive factors' do
      CousinRoman::ONES.each do |factor, number|
        1.upto(3).each do |reps|
          it "should convert #{factor*reps} to #{number*reps}" do
            CousinRoman::Roman.convert(factor*reps).should == (number*reps)
          end
        end
      end
    end

    context 'different power factors' do
      it 'should honor ones' do
        CousinRoman::Roman.convert('mcxi').should == 1111
      end

      it 'should honor fives' do
        CousinRoman::Roman.convert('dlv').should == 555
      end

      it 'should honor ones and fives together' do
        CousinRoman::Roman.convert('mdclxvi').should == 1666
      end

      it 'should honor subtractives ones and fives together' do
        CousinRoman::Roman.convert('mcmlxxxix').should == 1989
      end

      it 'should honor max number' do
        CousinRoman::Roman.convert('mmmcmxcix').should == 3999
      end

      it 'should honor the longest number' do
        CousinRoman::Roman.convert('dccclxxxviii').should == 888
      end

      it 'should be case insensitive' do
        number = 'MCXI'
        CousinRoman::Roman.convert(number).should == CousinRoman::Roman.convert(number.downcase)
      end
    end
  end

  describe 'to_arabic' do
    it 'should call convert on valid number' do
      CousinRoman::Roman.should_receive(:convert).and_call_original
      CousinRoman::Roman.to_arabic('MMM').should == 3000
    end

    it 'should return nil on invalid number' do
      CousinRoman::Roman.to_arabic('YRU?!').should be_nil
    end
  end

  describe 'to_arabic!' do
    it 'should call convert on valid number' do
      CousinRoman::Roman.should_receive(:convert).and_call_original
      CousinRoman::Roman.to_arabic!('MMM').should == 3000
    end

    it 'should throw TypeError on invalid number' do
      expect { CousinRoman::Roman.to_arabic!('YRU?!') }.to raise_error(TypeError)
    end
  end

end
