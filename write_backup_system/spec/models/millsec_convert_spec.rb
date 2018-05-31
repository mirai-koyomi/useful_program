require 'rails_helper'

RSpec.describe MillsecConvert, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'バリデートテスト' do
    context '二項目入力されている場合' do
      example '時差がなくても有効な状態であること' do
        millsec_convert = build(:millsec_convert)
        expect(millsec_convert).to be_valid
      end
      example '比較元がなくても有効な状態であること' do
        millsec_convert = build(:millsec_convert, before_date: nil, time_diff: Time.local(0).tomorrow.to_i)
        expect(millsec_convert).to be_valid
      end
      example '比較先がなくても有効な状態であること' do
        millsec_convert = build(:millsec_convert, after_date: nil, time_diff: Time.local(0).tomorrow.to_i)
        expect(millsec_convert).to be_valid
      end
    end
  end

  describe '時差の計算' do
    context '時差が空白の場合' do
      example '前後の時間があれば時差の計算が行われること' do
        datetime = Time.now

        millsec_convert = create(:millsec_convert, before_date: datetime, after_date: datetime.tomorrow )

        expect(millsec_convert.time_diff).to eq 60 * 24 * 60
      end
      example '比較先の時間の方が小さい場合、負の値を返すこと' do
        datetime = Time.now
        millsec_convert = create(:millsec_convert, before_date: datetime, after_date: datetime.yesterday )

        expect(millsec_convert.time_diff).to eq 0 - 60 * 24 * 60
      end
    end

    context '比較先の時間がない場合' do
      example '比較元の時間に基づき算出される' do
        datetime = Time.now
        p millsec_convert = build(:millsec_convert, before_date: datetime, after_date: nil, time_diff: 60 * 60 * 24)
        millsec_convert = create(:millsec_convert, before_date: datetime, after_date: nil, time_diff: 60 * 60 * 24)

        expect(millsec_convert.after_date).to eq datetime.tomorrow
      end
    end
  end

end
