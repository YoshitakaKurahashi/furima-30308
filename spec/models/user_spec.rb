require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user) #ユーザーのインスタンス生成
  end

  describe 'ユーザー新規登録' do

    context '新規登録がうまくいく時' do
      it "全てのカラムが存在すれば登録できる" do
        binding.pry
        expect(@user).to be_valid        #「be_valid」...expectのインスタンスが正しく保存されているか判断。
      end
      it "passwordが半角英数字混合の場合は登録できる" do
        @user.password = "111aaa"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it "名字と名前が全角の場合は登録できる" do
        @user.first_name = "かんべぇ"
        @user.last_name = "くろだ"
        expect(@user).to be_valid
      end
      it "フリガナ（名字と名前）が全角カナの場合は登録できる" do
        @user.first_kana = "カンベェ"
        @user.last_kana = "クロダ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないと時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""             #nicknameの値を空にする
        @user.valid?                    #valid?「正しいかどうか」を判定するメソッド
        # binding.pry                   #「user.errors.full_messages」をターミナルに打ちエラーメッセージを確認
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含まないと登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが6文字以上でないと登録できない" do
        @user.password = "111aa"
        @user.password_confirmation = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "paswordは半角数字のみでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordと確認用のpasswordの値が一致しないと登録できない" do
        @user.password = "111aaa"
        @user.password_confirmation = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名字が漢字・平仮名・カタカナ以外では登録できない" do
        @user.first_name = "KANBE"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "名前が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名前が漢字・平仮名・カタカナ以外では登録できない" do
        @user.last_name = "KURODA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "フリガナ（名字）が空だと登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it "フリガナ（名字）が全角カタカナ以外では登録できない" do
        @user.first_kana = "かんべぇ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end
      it "フリガナ（名前）が空だと登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it "フリガナ（名前）が全角カタカナ以外では登録できない" do
        @user.last_kana = "くろだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
