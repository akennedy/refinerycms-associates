Given /^I have no associates$/ do
  Associate.delete_all
end

Given /^I (only )?have associates titled "?([^\"]*)"?$/ do |only, titles|
  Associate.delete_all if only
  titles.split(', ').each do |title|
    Associate.create(:name => title)
  end
end

Then /^I should have ([0-9]+) associates?$/ do |count|
  Associate.count.should == count.to_i
end
