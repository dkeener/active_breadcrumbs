
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe ActiveBreadcrumbs do
  
  describe ": Utilities - " do
     
    before(:each) do
      @obj = BreadcrumbsTester.new
    end

    it "is_external_breadcrumb? can identify non-local URLs" do
      @obj.is_external_breadcrumb?('http://www.external.com').should be == true
    end
    
    it "is_external_breadcrumb? can identify local URLs" do
      @obj.is_external_breadcrumb?('internal').should be == false
    end

  end
  
end

