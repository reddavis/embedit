require File.dirname(__FILE__) + '/spec_helper.rb'

describe "SWF" do
  
  it "should show true on valid url" do
    Embedit::Media.new("http://v1.dothegreenthing.com/games/upgrade_circle/main.swf").should be_valid
  end
  
  it "should return filename as title" do
    Embedit::Media.new("http://v1.dothegreenthing.com/games/upgrade_circle/main.swf").title.should eql("main.swf")
  end
  
  it "should show format as rich" do
    Embedit::Media.new("http://v1.dothegreenthing.com/games/upgrade_circle/main.swf").format.should eql("rich")
  end
  
  it "should accept width and height options for embeded code" do
    embed = Embedit::Media.new("http://v1.dothegreenthing.com/games/upgrade_circle/main.swf").html(:width=>200, :height => 100)
    embed.match(/width="200"/).should_not be_nil
    embed.match(/height="100"/).should_not be_nil
  end
  
  it "should return correct the embed code" do
    Embedit::Media.new("http://v1.dothegreenthing.com/games/upgrade_circle/main.swf").html.should eql('<embed width="400" height="300" quality="high" src="http://v1.dothegreenthing.com/games/upgrade_circle/main.swf" type="application/x-shockwave-flash" allowfullscreen="true"/>')
  end
  
end