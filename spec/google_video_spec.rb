require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Google Video" do
  
  it "should show true on valid url" do
    Embedit::Media.new("http://video.google.com/videoplay?docid=9190313294638554619&hl=en").should be_valid
  end
  
  it "should have the title of 'Full Democratic Debate - Austin TX - Feb 21, 2008'" do
    Embedit::Media.new("http://video.google.com/videoplay?docid=9190313294638554619&hl=en").title.should eql("Full Democratic Debate - Austin TX - Feb 21, 2008")
  end
  
  it "should show format as video" do
    Embedit::Media.new("http://video.google.com/videoplay?docid=9190313294638554619&hl=en").format.should eql("video")
  end
  
  it "should width and height options for embeded code" do
    embed = Embedit::Media.new("http://video.google.com/videoplay?docid=9190313294638554619&hl=en").html(:width=>200, :height => 100)
    embed.match(/width:200px/).should_not be_nil
    embed.match(/height:100px/).should_not be_nil
  end
  
  it "should return correct embeded code" do
    embed = Embedit::Media.new("http://video.google.com/videoplay?docid=9190313294638554619&hl=en").html
    embed.should eql(%{<embed id="VideoPlayback" src="http://video.google.com/googleplayer.swf?docid=9190313294638554619&hl=en&fs=true" style="width:400px;height:326px" allowFullScreen="true" allowScriptAccess="always" type="application/x-shockwave-flash"> </embed>})
  end
  
end