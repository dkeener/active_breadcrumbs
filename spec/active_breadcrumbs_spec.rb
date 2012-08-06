
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe ActiveBreadcrumbs do

  before(:each) do
    @obj = BreadcrumbsTester.new
  end

  describe ": Utilities - " do

    it "is_external_breadcrumb? can identify non-local URLs" do
      @obj.is_external_breadcrumb?('http://www.external.com').should be == true
    end

    it "is_external_breadcrumb? can identify local URLs" do
      @obj.is_external_breadcrumb?('internal').should be == false
    end

    it "breadcrumb_separator_left provides the left separator" do
      @obj.breadcrumb_separator_left.should be == '&lt;'
    end

    it "breadcrumb_separator_right provides the rigth separator" do
      @obj.breadcrumb_separator_right.should be == '&gt;'
    end

    it "breadcrumb_size_limit provides the currently defined breadcrumb size limit" do
      @obj.breadcrumb_size_limit.should be == ActiveBreadcrumbs::Breadcrumbs::BREADCRUMB_SIZE_LIMIT
    end

    it "truncate does not change a string that is smaller than the limit" do
      @obj.truncate('Zebra', 30).should be == 'Zebra'
    end
    
    it "truncate does not change a string that is >= the ellipsis size" do
      @obj.truncate('Jed', 3).should be == 'Jed'
    end

    it "truncate does not change a string that is >= the ellipsis size" do
      @obj.truncate('Supercalifragilisticexpialidocious', 20).should be == 'Supercalifragilis...'
    end

  end

  describe ": Building Crumbs - " do

    before(:each) do
      @crumbs = ['Home', 'home_url',
                 'Tools', 'tools_url',
                 'Antimatter', 'antimatter_url']
    end

    it "should build crumb to a fully specified URL" do
      crumb = @obj.build_crumb('Test', 'http://www.external.com')
      crumb.should match 'Test'
      crumb.should match 'http://www.external.com'
    end

    it "should build crumb to a relative URL" do
      crumb = @obj.build_crumb('Test', '/books/123')
      crumb.should match 'Test'
      crumb.should match '/books/123'
    end

    it "should build breadcrumbs from an array" do
      bc = @obj.breadcrumbs(@crumbs)
      bc.should match 'Home'
      bc.should match 'Tools'
      bc.should match 'Antimatter'
    end

    it "should build breadcrumbs with a default separator pointing right" do
      bc = @obj.breadcrumbs(@crumbs)
      bc.should match '&gt;'
    end

    it "should build breadcrumbs with a default separator pointing left (and direction as a string)" do
      bc = @obj.breadcrumbs(@crumbs, :direction => 'left')
      bc.should match '&lt;'
    end

    it "should build breadcrumbs with a default separator pointing left (and direction as a symbol)" do
      bc = @obj.breadcrumbs(@crumbs, :direction => :left)
      bc.should match '&lt;'
    end
    
    it "should build breadcrumbs with a custom separator" do
      bc = @obj.breadcrumbs(@crumbs, :separator => '|')
      bc.should match '|'
    end

  end

end

