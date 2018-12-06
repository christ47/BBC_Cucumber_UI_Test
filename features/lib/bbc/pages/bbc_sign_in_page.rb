require 'capybara/dsl'

class BbcSignInPage
  include Capybara::DSL
  attr_reader :error_mesesage_for_password_length, :invalid_username_password_message, :invalid_password_format_message
  
  def initialize
    @error_mesesage_for_password_length = 'Sorry, that password is too short. It needs to be eight characters or more.'
    @invalid_username_password_message = "Sorry, we can’t find an account with that username. If you're over 13, try your email address instead or get help here."
    @invalid_password_format_message = "Sorry, that password isn't valid. Please include something that isn't a letter."
  end

  SIGN_IN_PAGE_URL = 'https://bbc.co.uk/signin'

  def visit_sign_in_page
    visit(SIGN_IN_PAGE_URL)
  end

  def fill_username_field_valid
    fill_in('user-identifier-input', :with => 'micheal2')
  end

  def fill_username_field_existing_username
    fill_in('user-identifier-input', :with => 'ManUtd ')
  end

  def invalid_username_error_message
    find('#form-message-username').text.include?("Sorry, we can’t find an account with that username. If you're over 13, try your email address instead")
  end

  def fill_password_field_valid
    fill_in('password-input', :with => 'happy123')
  end

  def fill_password_field_invalid_format
    fill_in('password-input', :with => 'happyyyyy')
  end

  def fill_password_field_invalid_length
    fill_in('password-input', :with => 'h1')
  end

  def click_sign_in_button
    click_button('submit-button')
  end

  def invalid_password_format_error_message
    find('#form-message-password').text
  end

  def invalid_password_length_error_message
    find('#form-message-password').text
  end

  def invalid_username_password_combination_error_message
    find('#form-message-username').text
  end

end
