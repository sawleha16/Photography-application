RSpec.describe User, type: :model do
  context 'validations' do
    context 'username' do
      specify do
        u = build(:user, username: nil)
        expect(u.valid?).to eq(false)
        expect(u.errors.messages).to eq({username: ["can't be blank"]})
      end
    end

    context 'age' do
      specify do
        u = build(:user, age: nil)
        expect(u.valid?).to eq(false)
        expect(u.errors.messages).to eq({age: ["can't be blank"]})
      end
    end
  end
end
