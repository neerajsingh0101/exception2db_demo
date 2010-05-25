require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class Exception2dbTest < ActiveSupport::TestCase

  context 'Exception2db' do
    setup do
      @count = Exception2db.count
      Exception2db.create(:exception => $exception_data_xml)
    end
    should 'should be able to create Exception2db record' do
      assert_equal @count + 1, Exception2db.count
    end
  end


end
