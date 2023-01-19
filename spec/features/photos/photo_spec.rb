RSpec.describe 'Photos', type: :feature do
  before do
    user
    user_login('abcd@gmail.com', '1234test')
    album
  end

  let(:user) { create(:user, email: 'abcd@gmail.com')}
  let(:album) { create(:album, name: 'abcd', description: 'abcdefg', user_id: user.id)}

  def create_album(name, description)
    visit "albums/new"
    expect do
      within("form#album_form") do
       fill_in 'Name', with: name
       fill_in 'Description', with: description
       find('input[type=submit]').click
      end
    end.to change(Album, :count).by(1)
  end

  context 'create photos' do
    specify do
      create_album('party', 'xyz xyz')
      expect(page).to have_link('add photos')
      click_link('add photos')
      expect do
        within('form#photo_form') do
          attach_file('photo[image]', 'spec/fixtures/test_file.jpg')
          fill_in 'photo[caption]', with: 'vmw vmw'
          find('input[type=submit]').click
        end
      end.to change(Photo, :count).by(1)
    end
  end

  context 'update photos' do
    let(:photo) {create(:photo, album: album, caption: "vmw vmw")}

    specify do
      create_album('party', 'xyz xyz')
      expect(page).to have_css('#aname', exact_text: 'party')
      expect(page).to have_link('add photos')
      click_link('add photos')
      visit "/albums/#{album.id}/photos/#{photo.id}/edit"
      within('form#photo_form') do
        attach_file('photo[image]', 'spec/fixtures/test_file.jpg')
        fill_in 'photo[caption]', with: 'hdt hdt'
        find('input[type=submit]').click
      end
      expect(Photo.last.caption).to eq("hdt hdt")
    end
  end
end
