Given /^an exception2db exists$/ do
  Exception2db.create(:exception => $exception_data_xml)
end
