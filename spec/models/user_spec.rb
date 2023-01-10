RSpec.describe User, type: :model do
  context 'validations' do
    context 'username' do
      specify do
        u = User.new(email: 'abc@gmail.com', password: '1234test', age: 24, username: nil)
        expect(u.valid?).to eq(false)
        expect(u.errors.messages).to eq({username: ["can't be blank"]})
      end
    end

    context 'age' do
      specify do
        u = User.new(email: 'abc@gmail.com', password: '1234test', age: nil, username: 'abc')
        expect(u.valid?).to eq(false)
        expect(u.errors.messages).to eq({age: ["can't be blank"]})
      end
    end
  end
end
