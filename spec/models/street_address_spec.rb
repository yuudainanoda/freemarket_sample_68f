require 'rails_helper'
describe Street_Address do
  describe '#create' do
    # 1. prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      user = build(:user, prefecture: nil)
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end
     # 2. cityが空では登録できないこと
     it "is invalid without a city" do
      user = build(:user, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
     end
    # 3. cityが空では登録できないこと
    it "is invalid without a zipcode" do
      user = build(:user, zipcode: nil)
      user.valid?
      expect(user.errors[:zipcode]).to include("can't be blank")
    end
    # 4. addressが空では登録できないこと
    it "is invalid without a address" do
      user = build(:user, address: nil)
      user.valid?
      expect(user.errors[:address]).to include("can't be blank")
    end
    # 5. first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 6. first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 7.last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    # 8. last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
   end
  end
end