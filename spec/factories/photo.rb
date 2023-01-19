FactoryBot.define do
  factory :photo  do
    image { Rack::Test::UploadedFile.new('spec/fixtures/test_file.jpg', 'image/jpeg') }
  end
end
