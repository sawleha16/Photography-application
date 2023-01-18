RSpec.describe 'index page', type: :feature do
  def user_login_form(email, password)
    within('form#new_user') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      find('input[type=submit]').click
      visit'/'
    end
  end

  context 'when the user is logged in' do
    before do
      create(:user, email: 'abc@gmail.com')
    end

   specify do
     visit root_path
     expect(page).to have_current_path('/users/sign_in')
     user_login_form('abc@gmail.com', '1234test')
     expect(page).to have_current_path(root_path)
     expect(page).to have_text('Welcome to 500px')
     expect(page).to have_css('#albums', exact_text: '')
   end
 end

 context 'when there is an album' do
   let(:user) { create(:user, email: 'abc@gmail.com')}
   let(:album) { create(:album, name: 'abcd', description: 'abcdefg', user_id: user.id)}
    before do
      album
    end

    specify do
      visit root_path
      expect(page).to have_current_path('/users/sign_in')
      user_login_form('abc@gmail.com', '1234test')
      expect(page).to have_current_path(root_path)
      expect(page).to have_text('Welcome to 500px')
      expect(page).to have_css('#albums', exact_text: 'abcd')
    end
  end
end
