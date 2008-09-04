require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Ovi tests" do
  
  it "should show video format for video" do
    create_media('http://share.ovi.com/media/DefragTV.public/DefragTV.10014').format.should == 'video'
  end
  
  it "should show audio format for audio" do
    create_media('http://share.ovi.com/media/ekki808.mu-sick/ekki808.10001').format.should == 'audio'
  end
  
  it "shold show audio title as 'mon'" do
    create_media('http://share.ovi.com/media/ekki808.mu-sick/ekki808.10001').title.should == 'mon'
  end
  
  it "should show photo format for photo" do
    create_media('http://share.ovi.com/media/james___.public/james___.10016').format.should == 'photo'
  end
  
  private
  
  def create_media(url)
    Embedit::Media.new(url)
  end
  
end