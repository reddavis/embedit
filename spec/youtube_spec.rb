require File.dirname(__FILE__) + '/spec_helper.rb'

describe "YouTube tests" do
  
  it "should show true on valid url" do
    a = create_media("http://www.youtube.com/watch?v=j3TOT1lnVTA").valid?
    a.should == true
  end
  
  it "should have the title of 'Best robot dance ever'" do
    a = create_media("http://www.youtube.com/watch?v=j3TOT1lnVTA").title
    a.should == 'Best robot dance ever'
  end
  
  it "should show format as video" do
    a = create_media("http://www.youtube.com/watch?v=j3TOT1lnVTA").format
    a.should == 'video'
  end
  
  it "should show false on invalid url" do
    a = create_media("http://www.youtube.com/watch?v=j3TOT1lnVTWWWWWWA").valid?
    a.should == false
  end
  
  private
  
  def create_media(url)
    Embedit::Media.new(url)
  end
  
end