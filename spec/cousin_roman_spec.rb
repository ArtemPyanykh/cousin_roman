require 'spec_helper'

describe CousinRoman do
  it 'should have a version number' do
    CousinRoman::VERSION.should_not be_nil
  end
end

describe String do
  [:to_arabian, :to_arabian!].each do |meth|
    it { should respond_to(meth) }

    it "should call CousinRoman::Roman.#{meth} on String##{meth}" do
      roman = 'i'
      CousinRoman::Roman.should_receive(meth).with(roman).and_call_original
      roman.send(meth).should == 1
    end
  end
end

describe Integer do
  [:to_roman, :to_roman!].each do |meth|
    it "should call CousinRoman::Arabian.#{meth} on Fixnum##{meth}" do
      arabian = 1
      CousinRoman::Arabian.should_receive(meth).with(arabian).and_call_original
      arabian.send(meth).should == 'I'
    end
  end
end
