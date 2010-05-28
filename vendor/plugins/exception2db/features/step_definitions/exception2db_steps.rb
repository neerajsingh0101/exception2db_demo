Given /^an exception2db exists$/ do
  Exception2db.create(:exception => $exception_data_xml)
end

Then /^I should see a link with text "(.*)" within "(.*)" with url "(.*)"$/ do |text, selector, url|
  assert_equal 'Powered by exception2db', text
  assert_equal '#footer', selector
  with_scope(selector) do
    page.find_link(text)[:href].should == url
  end
end
