And /^I (should|should not) be able to buy products$/ do |meth|
  el = '//table[@id="products"]//tr[2]/td[3]'
  if meth == 'should'
    find(:xpath, el).should_not have_content('Login to purchase!')
    find(:xpath, el).should have_content('To cart')
  else
    find(:xpath, el).should have_content('Login to purchase!')
  end

end

Then /^I (should|should not) have access to the cart$/ do |meth|
  cart = '//div[@id="cart"]'
  if meth == 'should'
    find(:xpath, cart).should_not have_content('Please sign in to begin shopping.')
  else
    find(:xpath, cart).should have_content('Please sign in to begin shopping.')
  end
end