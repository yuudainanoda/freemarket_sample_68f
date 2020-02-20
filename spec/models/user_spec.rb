require 'rails_helper'
describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "全ての項目があれば登録できる。" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

     # 6. first_nameが空では登録できないこと
     it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

      # 7. first_name_kanaが空では登録できないこと
      it "is invalid without a first_name_kana" do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end

        # 8.last_nameが空では登録できないこと
     it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

       # 9. last_name_kanaが空では登録できないこと
       it "is invalid without a last_name_kana" do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("can't be blank")
      end
      # 10. birth_yearが空では登録できないこと
      it "is invalid without a birth_year" do
        user = build(:user, birth_year: nil)
        user.valid?
        expect(user.errors[:birth_year]).to include("can't be blank")
      end
      # 11. birth_monthが空では登録できないこと
      it "is invalid without a birth_month" do
        user = build(:user, birth_month: nil)
        user.valid?
        expect(user.errors[:birth_month]).to include("can't be blank")
      end
       # 12. birth_dayが空では登録できないこと
      it "is invalid without a birth_day" do
        user = build(:user, birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include("can't be blank")
      end

      # 13. 重複したemailが存在する場合登録できないこと
      it "is invalid with a duplicate email address" do
        user = create(:user, email: "test@gmail.com")
        another_user = build(:user, email: "test@gmail.com")
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      # 14. passwordが7文字以上であれば登録できること
      it "is valid with a password that has more than 7 characters " do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        user.valid?
        expect(user).to be_valid
      end
      
  end
end