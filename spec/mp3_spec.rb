require File.dirname(__FILE__) + '/spec_helper.rb'

describe "MP3" do
  
  it "should show true on valid url" do
    Embedit::Media.new("http://s13a.non-standard.net/sec/c7c56166740ab9310ee70f132b9bf897/48fa0f08/archive/509/3/8dfbd9231557c6e6b1ad62f1549afb62.mp3").should be_valid
  end
  
  it "should return filename as title" do
    Embedit::Media.new("http://s13a.non-standard.net/sec/c7c56166740ab9310ee70f132b9bf897/48fa0f08/archive/509/3/8dfbd9231557c6e6b1ad62f1549afb62.mp3").title.should eql("8dfbd9231557c6e6b1ad62f1549afb62.mp3")
  end
  
  it "should show format as audio" do
    Embedit::Media.new("http://s13a.non-standard.net/sec/c7c56166740ab9310ee70f132b9bf897/48fa0f08/archive/509/3/8dfbd9231557c6e6b1ad62f1549afb62.mp3").format.should eql("audio")
  end
  
  it "should accept width and height options for embeded code" do
    embed = Embedit::Media.new("http://s13a.non-standard.net/sec/c7c56166740ab9310ee70f132b9bf897/48fa0f08/archive/509/3/8dfbd9231557c6e6b1ad62f1549afb62.mp3").html(:width=>200, :height => 100)
    embed.match(/width="200"/).should_not be_nil
    embed.match(/height="100"/).should_not be_nil
  end
  
  it "should return correct the embed code" do
    Embedit::Media.new("http://s13a.non-standard.net/sec/c7c56166740ab9310ee70f132b9bf897/48fa0f08/archive/509/3/8dfbd9231557c6e6b1ad62f1549afb62.mp3").html.should eql('<embed src="http://s3.amazonaws.com/panda-test/player.swf" width="400" height="20" allowfullscreen="true" allowscriptaccess="always" flashvars="&displayheight=20&file=http://s13a.non-standard.net/sec/c7c56166740ab9310ee70f132b9bf897/48fa0f08/archive/509/3/8dfbd9231557c6e6b1ad62f1549afb62.mp3&width=400&height=20" />')
  end
  
end