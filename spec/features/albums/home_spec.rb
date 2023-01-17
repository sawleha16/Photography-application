RSpec.describe 'home page', type: :feature do
  context 'when the user is logged in' do
    before do
      create(:user, email: 'abc@gmail.com')
    end

    specify do
      # create user
      # visit root_path
      # interact with form and fill all the details
      # submit the form
      # check the root path and it should be /albums
      visit root_path
      expect(page).to have_current_path('/users/sign_in')
      within('form#new_user') do
        fill_in 'Email', with: 'abc@gmail.com'
        fill_in 'Password', with: '1234test'
        find('input[type=submit]').click
      end
      expect(page).to have_current_path(root_path)
    end
  end

  context 'when the user is not logged in' do
    specify do
      visit root_path
      expect(page).to have_current_path('/users/sign_in')
    end
  end
end
