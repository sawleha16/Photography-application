RSpec.describe 'Album', type: :feature do
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

  context 'Edit album details' do
    let(:user) { create(:user, email: 'abc@gmail.com')}
    let(:album) { create(:album, name: 'abcd', description: 'abcdefg', user_id: user.id)}
    before do
      album
    end

    specify  do
      visit root_path
      user_login_form('abc@gmail.com', '1234test')
      expect(page).to have_css('#albums', exact_text: 'abcd')
      click_link('abcd')
      expect(page). to have_link("Edit")
      click_link('Edit')
      visit  "/albums/#{album.id}/edit"
      album_form('xyz','hdt hdt')
      expect(page).to have_css('#aname', exact_text: 'xyz')
      end
    end
  end
