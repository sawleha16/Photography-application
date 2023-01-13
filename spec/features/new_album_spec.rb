RSpec.describe 'Albums', type: :feature do
  def user_login_form(email, password)
    within('form#new_user') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      find('input[type=submit]').click
      visit'/'
    end
  end

  def album_form(name, description)
    within("form#album_form") do
     fill_in 'Name', with: name
     fill_in 'Description', with: description
     find('input[type=submit]').click
    end
  end

  context 'Create new album' do
    before do
      create(:user, email: 'abc@gmail.com')
    end

    specify  do
      visit root_path
      expect(page).to have_current_path('/users/sign_in')
        user_login_form('abc@gmail.com', '1234test')

      visit "/albums/new"
      expect do
        album_form('party','xyz xyz')
      end.to change(Album, :count).by(1)
    end

    specify do
      visit root_path
      expect(page).to have_current_path('/users/sign_in')
        user_login_form('abc@gmail.com', '1234test')

      visit "/albums/new"
      expect do
        album_form(nil,nil)
      end.to change(Album, :count).by(0)
      expect(page).to have_css('#name_error', exact_text: "Name can't be blank")
      expect(page).to have_css('#description_error', exact_text: "Description can't be blank")
    end
  end
end
