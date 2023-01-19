module SessionHelpers
  def user_login(email, password)
    visit root_path
    expect(page).to have_current_path('/users/sign_in')
    within('form#new_user') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      find('input[type=submit]').click
      visit '/'
    end
  end
end


RSpec.configure do |config|
  config.include SessionHelpers, type: :feature
end
