require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Twitter" do
  
  it "should show true on valid url" do
    Embedit::Media.new("http://twitter.com/Bumi/statuses/937196371").should be_valid
  end
  
  it "should return the correct title" do
    Embedit::Media.new("http://twitter.com/Bumi/statuses/937196371").title.should eql("Twitter / Michael Bumann: I love github!")
  end
  
  it "should show format as photo" do
    Embedit::Media.new("http://twitter.com/Bumi/statuses/937196371").format.should eql("photo")
  end
  
  it "should accept width and height options for embeded code" do
    embed = Embedit::Media.new("http://twitter.com/Bumi/statuses/937196371").html(:width=>200, :height => 100)
    embed.match(/width="200"/).should_not be_nil
    embed.match(/height="100"/).should_not be_nil
  end
  
  it "should return correct the embed code" do
    Embedit::Media.new("http://twitter.com/Bumi/statuses/937196371").html.should eql('<img src="http://twictur.es/i/937196371.gif"  />')
  end
  
end