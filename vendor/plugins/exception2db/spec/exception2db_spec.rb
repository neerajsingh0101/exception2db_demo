require File.dirname(__FILE__) + '/spec_helper'

describe Exception2db do

  it { should validate_presence_of(:exception) }

  describe "should raise an error when exception is blank and record is saved with false option" do
    exception2db = Exception2db.new(:exception => nil)
    # Pass 'false' to 'save' in order to skip the validations.
    it "should raise an exception" do
      lambda { exception2db.save(false) }.should raise_exception(ActiveRecord::StatementInvalid)
    end
  end

  describe "should be able to create a new record" do
    subject { Exception2db.create(:exception => 'hello world') }
    specify { subject.new_record?.should be_false }
  end

  context "attributes" do
    subject { Exception2db.create(:exception => $exception_data_xml) }


    it "#cgi_data"
    it "#parameters"
    it "#action"
    it "#formatted_backtrace"

    specify { subject.top_file_and_line_number.should == '[PROJECT_ROOT]/vendor/plugins/exception2db/app/controllers/exception2db/main_controller.rb:10' }
    specify { subject.environment.should == 'production' }
    specify { subject.url.should == 'http://localhost:3000/exception2db' }
    specify { subject.controller.should == 'exception2db/main' }
    specify { subject.error_message.should == 'RuntimeError: 46' }
    specify { subject.user_agent.should == "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.38 Safari/533.4" }
  end

end
