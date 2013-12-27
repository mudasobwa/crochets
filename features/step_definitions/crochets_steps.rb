Given(/^The respective aspects are applied$/) do
  
end

When(/^I do not set the hook on tester method$/) do

end

When(/^I set the hook on tester method$/) do
  @aspect = Crochets::Crocheter.hook(Crochets::Tester, :some_method, before: true) do |obj, *args|
    puts "BLOCKING BEFORE"
  end
  @aspect2 = Crochets::Crocheter.hook(Crochets::Tester, :some_method, before: true) do |obj, *args|
    puts "BLOCKING BEFORE 2"
  end
end

When(/^I set the non\-blocking hook on tester method$/) do
  @aspect = Crochets::Crocheter.hook(Crochets::Tester, :some_method, after: true, blocking: false) do |obj, *args|
    sleep 1
    puts "NON-BLOCKING AFTER"
  end
end

When(/^I wait for a while$/) do
  sleep 1
end

When(/^I unset the hook on tester method$/) do
  Crochets::Crocheter.unhook @aspect
end

Then(/^the hook is being called$/) do
  Crochets::Tester.new.some_method
end

Then(/^the hook is not being called$/) do
  Crochets::Tester.new.some_method
end

