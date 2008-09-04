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
  
end

describe "Flickr oEmbed tests" do
  
  it "should validate a valid Flickr url" do
    media = Embedit::Media.new('http://www.flickr.com/photos/asianmack/2781811902/in/set-72157606856535809/').valid?
    media.should == true
  end
  
  it "should validate an invalid Flickr url" do
    media = Embedit::Media.new('http://www.flickr.com/photos/banuelos_ismael/280428728023/').valid?
    media.should == false
  end
  
end

describe "Viddler oEmbed tests" do
  
  it "should validate a valid Viddler url" do
    media = Embedit::Media.new('http://www.viddler.com/explore/winelibrarytv/videos/635/').valid?
    media.should == true
  end
  
  it "should validate an invalid Viddler url" do
    media = Embedit::Media.new('http://www.viddler.com/explore/winelibrarytv/videos/635222/').valid?
    media.should == false
  end
  
end

describe "Qik oEmbed tests" do
  
  it "should validate a valid Qik url" do
    media = Embedit::Media.new('http://qik.com/video/239734').valid?
    media.should == true
  end
  
  it "should validate an invalid Qik url" do
    media = Embedit::Media.new('http://qik.com/video/2397342222132131').valid?
    media.should == false
  end
    
end

describe "Pownce oEmbed tests" do
  
  it "should validate a valid Pownce url" do 
    media = Embedit::Media.new('http://pownce.com/dburka/notes/2951118/').valid?
    media.should == true
  end
  
  it "should validate a invalid Pownce url" do
    media = Embedit::Media.new('http://pownce.com/dburka/notes/295111822/').valid?
    media.should == false
  end
  
end

describe "Revision3 oEmbed tests" do
  
  it "should validate a valid Rev3 url" do 
    media = Embedit::Media.new('http://revision3.com/trs/FlipOut/?autoplay=true&hp').valid?
    media.should == true
  end
  
  it "should validate a invalid Rev3 url" do
    media = Embedit::Media.new('http://revision3.com/trsa/FqlipOusat/?autoplay=true&hp').valid?
    media.should == false
  end
  
end





