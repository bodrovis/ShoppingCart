Given /^there are some products$/ do
  5.times {FactoryGirl.create(:product)}
end

When /^I add product to cart$/ do
  button = '//table[@id="products"]//tr[2]/td[3]/a'
  find(:xpath, button).click
end

Then /^there should be (\d+) products? in the cart$/ do |count|
  if count == '0'
    page.should_not have_xpath('//ul[@id="cart-items"]/li[1]')
  else
    find(:xpath, '//ul[@id="cart-items"]/li[1]/span[@class="quantity"]').should have_content(count)
  end
end

When /^I remove product from the cart$/ do
  find(:xpath, '//ul[@id="cart-items"]/li[1]/a').click
end