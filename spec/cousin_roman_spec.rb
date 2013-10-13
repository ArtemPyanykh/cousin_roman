require 'spec_helper'

describe CousinRoman do
  it 'should have a version number' do
    CousinRoman::VERSION.should_not be_nil
  end
end

describe String do
  [:to_arabic, :to_arabic!].each do |meth|
    it { should respond_to(meth) }

    it "should call CousinRoman.#{meth} on String##{meth}" do
      roman = 'i'
      CousinRoman::Roman.should_receive(meth).with(roman).and_call_original
      roman.send(meth).should == 1
    end
  end
end
