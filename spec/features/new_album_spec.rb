
RSpec.describe 'Albums', type: :feature do

context 'Create new album' do
before do
  create(:user, email: 'abc@gmail.com')
end

specify  do
  visit root_path
    expect(page).to have_current_path('/users/sign_in')
    within('form#new_user') do
      fill_in 'Email', with: 'abc@gmail.com'
      fill_in 'Password', with: '1234test'
      find('input[type=submit]').click
      visit'/'
    end

    visit "/albums/new"
      expect do
        within("form#album_form") do
          fill_in 'Name', with: 'party'
          fill_in 'Description', with: 'xyz xyz'
          find('input[type=submit]').click
        end
      end.to change(Album, :count).by(1)
    end
  end
end
