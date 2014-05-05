Given /^I am logged in$/ do
  user = FactoryGirl.create(:user)
  page.set_rack_session(user: user.id)
end