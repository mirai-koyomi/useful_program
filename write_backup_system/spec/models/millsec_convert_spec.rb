require 'rails_helper'

RSpec.describe MillsecConvert, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'バリデートテスト' do
    example "前後時間があれば有効な状態であること" do
      millsec_convert = build(:millsec_convert)
      expect(millsec_convert).to be_valid
    end
    example "比較元時間がなければ無効な状態であること" do
      millsec_convert = build(:millsec_convert, before_time: nil)
      expect(millsec_convert).not_to be_valid
    end
    example "比較先時間がなければ無効な状態であること" do
      millsec_convert = build(:millsec_convert, after_time: nil)
      expect(millsec_convert).not_to be_valid
    end
  end

  describe '時差の計算' do
    example '前後の時間があれば時差の計算が行われること' do
      datetime = DateTime.now
      millsec_convert = build(:millsec_convert, before_time: datetime, after_time: datetime.ago(1.days) )

      expect(millsec_convert.difference).to eq 60 * 24 * 60
    end
    example '比較先の時間の方が小さい場合、負の値を返すこと' do
      datetime = DateTime.now
      millsec_convert = build(:millsec_convert, before_time: datetime, after_time: datetime.since(1.days) )

      expect(millsec_convert.difference).to eq 0 - 60 * 24 * 60
    end
  end

end
