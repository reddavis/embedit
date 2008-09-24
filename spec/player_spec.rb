require File.dirname(__FILE__) + '/spec_helper.rb'

describe "JW player tests" do
   
  it "should show false on invalid path" do
    a = create_media("aslkdh/asd/asdasda").valid?
    a.should == false
  end
      
  it "should show false on invalid url" do
    a = create_media("../test.flv").valid?
    a.should == true
  end
  
  private
  
  def create_media(url)
    Embedit::Media.new(url)
  end
  
end
