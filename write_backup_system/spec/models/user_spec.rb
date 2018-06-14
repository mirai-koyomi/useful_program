require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデートテスト' do
    context '必須要素が全て入力されている場合' do
      example '有効な状態であること' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'スクリーンネームが未入力の場合' do
      example '無効な状態であること' do
        user = build(:user, screen_name: nil)
        expect(user).not_to be_valid
      end
    end

    context '名前が未入力の場合' do
      example '無効な状態であること' do
        user = build(:user, name: nil)
        expect(user).not_to be_valid
      end
    end

    context 'パスワードが未入力の場合' do
      example '無効な状態であること' do
        user = build(:user, password: nil)
        expect(user).not_to be_valid
      end
    end

    context 'パスワード確認が未入力の場合' do
      example '無効な状態であること' do
        user = build(:user, password_confirmation: nil)
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが一致しない場合' do
      example '無効な状態であること' do
        user = build(:user, password: "your_password", password_confirmation: "other_password")
        expect(user).not_to be_valid
      end
    end
  end
end
