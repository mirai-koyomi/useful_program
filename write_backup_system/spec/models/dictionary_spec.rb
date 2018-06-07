require 'rails_helper'

RSpec.describe Dictionary, type: :model do
  describe 'ステータスのバリデーション' do
    example '下書きの場合、有効な状態であること' do
      dictionary = build(:dictionary, :draft)
      expect(dictionary.status).to be_valid
    end
    example 'リリーズの場合、有効な状態であること' do
      dictionary = build(:dictionary, :release)
      expect(dictionary.status).to be_valid
    end
    example '下書き、リリース以外の場合、無効な状態であること' do
      dictionary = build(:dictionary, :draft, status: 'test')
      expect(dictionary.status).not_to be_valid
    end
  end
  describe '値の整形' do
    example 'タイトルが空だった場合、自動で仮のタイトルが入ること' do
      dictionary = build(:dictionary, :draft, title: nil)
      expect(dictionary.title).not_to be_empty
    end
    example 'ステータスが空だった場合、draftが入ること' do
      dictionary = build(:dictionary, :draft, status: nil)
      expect(dictionary.status).to eq 'draft'
    end
    example '公開設定が空だった場合、falseが入ること' do
      dictionary = build(:dictionary, :draft, status: nil)
      expect(dictionary.publish).to be_falsey
    end
    example '下書きの場合、公開設定がfalseになること' do
      dictionary = build(:dictionary, :draft, publish: true)
      expect(dictionary.publish).to be_falsey
    end
  end
end