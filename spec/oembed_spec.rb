require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Vimeo oEmbed tests" do
  
  it "should properly validate a valid Vimeo url" do
    media = Embedit::Media.new('http://www.vimeo.com/1263763').valid?
    media.should == true
  end
  
  it "should validate an invalid (with only numbers) Vimeo url" do
    media = Embedit::Media.new('http://www.vimeo.com/126007722').valid?
    media.should == false
  end
  
  it "should validate an invalid (with some letters) Vimeo url" do
    media = Embedit::Media.new('http://www.vimeo.com/126badurl').valid?
    media.should == false
  end

end

describe "Flickr oEmbed tests" do
  
  it "should properly validate a valid Flickr url" do
    media = Embedit::Media.new('http://www.flickr.com/photos/asianmack/2781811902/in/set-72157606856535809/').valid?
    media.should == true
  end
  
  it "should properly validate an invalid (with only numbers) Flickr url" do
    media = Embedit::Media.new('http://www.flickr.com/photos/banuelos_ismael/280428728023/').valid?
    media.should == false
  end
  
  it "should properly validate an invalid (with some letters) Flickr url" do
    media = Embedit::Media.new('http://www.flickr.com/photos/banuelos_ismael/2804287asd23/').valid?
    media.should == false
  end
  
  it "should properly validate an invalid (with some letters) Flickr url" do
    media = Embedit::Media.new('http://www.flickr.com/photos/banuelos_ismael/2804287asd23/').valid?
    media.should == false
  end
  
  it "should properly validate an invalid Flickr url photos/url-here" do
    media = Embedit::Media.new('http://www.flickr.com/photos/as').valid?
    media.should == false
  end
  
end