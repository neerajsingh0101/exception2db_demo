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

  it "should raise an error when created_at is blank and record is saved with false option"

  describe "should be able to create a new record" do
    subject { Exception2db.create(:exception => 'hello world') }
    specify { subject.new_record?.should be_false }
  end

  context "attributes" do
    subject { Exception2db.create(:exception => $exception_data_xml) }
    specify { subject.error_message.should == 'RuntimeError: 46' }
  end

end
