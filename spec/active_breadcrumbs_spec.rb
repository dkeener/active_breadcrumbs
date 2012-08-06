
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe ActiveBreadcrumbs do
  
  describe ": Utilities - " do
     
    before(:each) do
      
    end

    it "is_external_breadcrumb? can identify non-local URLs" do
      xml = File.read(File.join(Xsd::UIEF_PATH, 'uief_sample_cir.xml'))
      xml.should_not be_nil
      
      errs = @cir_xsd.valid?(xml)
      errs.should == []
    end

  end
  
end

