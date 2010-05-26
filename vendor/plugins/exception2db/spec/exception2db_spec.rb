require File.dirname(__FILE__) + '/spec_helper'

describe Exception2db do

 it { should validate_presence_of(:exception) }


 it "" do
  pending "should raise and error when exception is blank and record is saved with false option"
 end
 

 it "" do
  pending "should raise and error when created_at is blank and record is saved with false option"
 end

end



#class Exception2dbTest < ActiveSupport::TestCase

#context 'Exception2db' do
#setup do
#@count = Exception2db.count
#@exception2db = Exception2db.create(:exception => $exception_data_xml)
#end
#should 'should be able to create Exception2db record' do
#assert_equal @count + 1, Exception2db.count
#end
#should 'have the right value' do
#assert_equal "RuntimeError: 46", @exception2db.error_message
#end
#end


#end
