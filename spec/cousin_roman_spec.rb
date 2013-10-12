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
      CousinRoman.should_receive(meth)
      subject.send(meth)
    end
  end
end
