Given("I access the BBC login page") do
  bbc_homepage.visit_homepage
  bbc_homepage.click_sign_in_link
end

And("I input incorrect username details") do
  bbc_sign_in_page.fill_username_field_valid
end

And("I input incorrect password details") do
  bbc_sign_in_page.fill_password_field_valid
end

When("I click the sign in button") do
  bbc_sign_in_page.click_sign_in_button
end

Then("I receive an error stating it needs to be at least 8 chars") do
  expect(bbc_sign_in_page.invalid_password_length_error_message).to eq bbc_sign_in_page.error_mesesage_for_password_length
end

Given("I input any username details") do
  bbc_sign_in_page.fill_username_field_existing_username
end

Given("I input a incorrect password as 1234abc") do
  fill_in('password-input', :with => '1234abc')
end

Then("I receive an error for not finding the account") do
  expect(bbc_sign_in_page.invalid_username_password_combination_error_message).to eq bbc_sign_in_page.invalid_username_password_message
end

Given("I input a password with the only letters") do
  bbc_sign_in_page.fill_password_field_invalid_format
end

Then("I recieve an error stating it needs to be in the correct format") do
  expect(bbc_sign_in_page.invalid_password_length_error_message).to eq bbc_sign_in_page.invalid_password_format_message
end

Given("I input an existing username") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I input an incorrect valid password") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I receive an error stating the password-username combination is wrong") do
  pending # Write code here that turns the phrase above into concrete actions
end
