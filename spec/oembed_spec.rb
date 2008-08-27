require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Vimeo oEmbed tests" do
  
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
    media.should == false
  end

end

describe "Flickr oEmbed tests" do
  
  it "should properly validate a valid Flickr url" do
    media = Embedit::Media.new('http://www.flickr.com/photos/asianmack/2781811902/in/set-72157606856535809/').valid?
    media.should == true
  end
  
  it "should properly validate an un-valid (with only numbers) Flickr url" do
    media = Embedit::Media.new('http://www.flickr.com/photos/asianmack/2781811902/in/set-72157606856535809/').valid?
    media.should == true
  end
  
end