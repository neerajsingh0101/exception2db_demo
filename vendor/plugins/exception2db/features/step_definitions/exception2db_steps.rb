Given /^an exception2db exists$/ do
  Exception2db.create(:exception => $exception_data_xml)
end

Then /^I should see a link with text "(.*)" within "(.*)" with url "(.*)"$/ do |text, selector, url|
  with_scope(selector) do
    page.find_link(text)[:href].should == url
  end
end

Then /^I should see response code as (.*)$/ do |response_code|
  puts page.inspect
end
