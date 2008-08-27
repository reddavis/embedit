require File.dirname(__FILE__) + '/spec_helper.rb'

describe Embedit::Media do
  
  it "should properly validate a valid Vimeo url" do
    media = Embedit::Media.new('http://www.vimeo.com/1263763').valid?
    media.should == true
  end
  
  it "should validate an un-valid (with only numbers) Vimeo url" do
    media = Embedit::Media.new('http://www.vimeo.com/126007722').valid?
    media.should == false
  end
  
  it "should validate an un-valid (with some letters) Vimeo url" do
    media = Embedit::Media.new('http://www.vimeo.com/126badurl').valid?
  end
  
end