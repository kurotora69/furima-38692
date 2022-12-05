require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'test', last_name:'tetuko', first_name_read:'テスト',last_name_read:'テツコ',birthday:'')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do

      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'first_nameが空では登録できない' do
      user.valid?
      expect(user.errors.full_messages).to include("First_name can't be blank")
    end

    it 'last_nameが空では登録できない' do
      user.valid?
      expect(user.errors.full_messages).to include("Last_name can't be blank")
    end

    it 'first_name_readが空では登録できない' do
      user.valid?
      expect(user.errors.full_messages).to include("First_name_read can't be blank")
    end

    it 'last_name_readが空では登録できない' do
      user.valid?
      expect(user.errors.full_messages).to include("Last_name_read can't be blank")
    end

    it 'birthdayが空では登録できない' do
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
