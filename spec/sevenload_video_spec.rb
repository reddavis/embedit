require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Sevenload Video" do
  
  def videos
    [
      { :url => "http://de.sevenload.com/videos/NWwrZzk-Flugzeug-Rennen", :title => "Flugzeug Rennen" },
      { :url => "http://de.sevenload.com/sendungen/Pferdeverstehen/folgen/LDvQYeZ-Vorfuehrung-Freiheitsdressur", :title => "Vorführung Freiheitsdressur" },
      { :url => "http://en.sevenload.com/videos/06Ae3BE-No-risk-no-fun-3", :title => "No risk, no fun 3" },
      { :url => "http://en.sevenload.com/shows/Wine-Library-TV/episodes/1sHBywY-Sippin-Some-Tequila-With-a-Guest-Episode-529", :title => "Sippin’ Some Tequila With a Guest - Episode #529" },
      { :url => "http://fr.sevenload.com/videos/Z8EMpxo-The-Bounce-Effect", :title => "The Bounce Effect" } ,
      { :url => "http://fr.sevenload.com/emissions/huberbuam/episodes/f5ZpMoT-Am-Limit-Trailer-Film-Trailer-On-the-Limit", :title => 'Am Limit Trailer/Film Trailer &quot;On the Limit&quot;' }
    ]
  end
  
  it "should show true on valid url" do
    videos.each do |v|
      Embedit::Media.new(v[:url]).should be_valid
    end
  end
  
  it "should match the different urls" do
    videos.each do |v|
      Embedit::SevenloadVideo.match(v[:url]).should_not be_nil
    end
  end
  
  it "should return the correct titles of the different urls" do
    videos.each do |v|
      Embedit::Media.new(v[:url]).title.should eql(v[:title])
    end
  end
  
  it "should show format as video" do
    videos.each do |v|
      Embedit::Media.new(v[:url]).format.should eql("video")
    end
  end
  
  it "should accept width and height options for embeded code" do
    embed = Embedit::Media.new("http://de.sevenload.com/videos/vNAluQj-MacBookAirPl0gbariPhone").html(:width=>200, :height => 100)
    embed.match(/200x100\/swf/).should_not be_nil
    embed.match(/width="200"/).should_not be_nil
    embed.match(/height="100"/).should_not be_nil
  end
  
end