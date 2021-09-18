require "rails_helper"

RSpec.describe "ユーザ管理機能", type: :system do
  describe "アカウント登録" do
    context "入力値が正しい場合" do
      it "メールとパスワードがある場合、アカウント登録できる" do
        visit new_user_registration_path
        fill_in "email", with: "test@example.com"
        fill_in "password", with: "testtest"
        fill_in "password_confirmation", with: "testtest"
        click_button "登録する"
        expect(page).to have_content "アカウント登録が完了しました。"
      end
    end

    context "入力値が不正の場合" do
      it "メールがない場合、無効である" do
        visit new_user_registration_path
        fill_in "email", with: ""
        fill_in "password", with: "testtest"
        fill_in "password_confirmation", with: "testtest"
        click_button "登録する"
        expect(page).to have_content "Eメールを入力してください"
      end

      it "パスワードがない場合、無効である" do
        visit new_user_registration_path
        fill_in "email", with: "test@example.com"
        fill_in "password", with: ""
        fill_in "password_confirmation", with: ""
        click_button "登録する"
        expect(page).to have_content "パスワードを入力してください"
      end

      it "パスワードが6文字以内の場合、無効である" do
        visit new_user_registration_path
        fill_in "email", with: "test@example.com"
        fill_in "password", with: "test"
        fill_in "password_confirmation", with: "test"
        click_button "登録する"
        expect(page).to have_content "パスワードは6文字以上で入力してください"
      end

      it "パスワードが一致しない場合、無効である" do
        visit new_user_registration_path
        fill_in "email", with: "test@example.com"
        fill_in "password", with: "testtest"
        fill_in "password_confirmation", with: "testtesttest"
        click_button "登録する"
        expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it "重複したメールアドレスの場合、無効である" do
        FactoryBot.create(:user)
        visit new_user_registration_path
        fill_in "email", with: "test@example.com"
        fill_in "password", with: "testtest"
        fill_in "password_confirmation", with: "testtest"
        click_button "登録する"
        expect(page).to have_content "Eメールはすでに存在します"
      end
    end
  end

  describe "アカウント情報変更" do
    before do
      FactoryBot.create(:user)
      FactoryBot.create(:user, id: 2, email: "foofoo@example.com")
      visit new_user_session_path
      fill_in "email", with: "test@example.com"
      fill_in "password", with: "testtest"
      click_button "ログイン"
      visit edit_user_registration_path
    end
    context "入力値が正しい場合" do
      it "メールアドレスを変更できる" do
        fill_in "email", with: "new_test@example.com"
        fill_in "current_password", with: "testtest"
        click_button "更新"
        expect(page).to have_content "アカウント情報を変更しました。"
      end

      it "パスワードを変更できる" do
        fill_in "password", with: "newtesttest"
        fill_in "password_confirmation", with: "newtesttest"
        fill_in "current_password", with: "testtest"
        click_button "更新"
        expect(page).to have_content "アカウント情報を変更しました。"
      end

      it "アカウントを削除できる" do
        execute_script('window.scrollBy(0,10000)')
        find("a", text: "アカウントを削除").click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
      end
    end

    context "入力値が不正の場合" do
      it "現在のパスワードが空欄の場合、無効である" do
        fill_in "password", with: "newtesttest"
        fill_in "password_confirmation", with: "newtesttest"
        click_button "更新"
        expect(page).to have_content "現在のパスワードを入力してください"
      end

      it "現在のパスワードが不一致の場合、無効である" do
        fill_in "password", with: "newtesttest"
        fill_in "password_confirmation", with: "newtesttest"
        fill_in "current_password", with: "test"
        click_button "更新する"
        expect(page).to have_content "現在のパスワードは不正な値です"
      end

      it "パスワード変更で確認用と不一致の場合、無効である" do
        fill_in "password", with: "newtesttest"
        fill_in "password_confirmation", with: "newtest"
        fill_in "current_password", with: "testtest"
        click_button "更新"
        expect(page).to have_content "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it "重複したメールアドレスの場合、無効である" do
        fill_in "email", with: "foofoo@example.com"
        fill_in "current_password", with: "testtest"
        click_button "更新"
        expect(page).to have_content "Eメールはすでに存在します"
      end
    end
  end

  describe "ログイン、ログアウト" do
    before do
      FactoryBot.create(:user)
    end
    context "入力値が正しい場合" do
      it "ログインできる" do
        visit new_user_session_path
        fill_in "email", with: "test@example.com"
        fill_in "password", with: "testtest"
        click_button "ログインする"
        expect(page).to have_content "ログインしました。"
      end

      it "ログアウトできる" do
        visit new_user_session_path
        fill_in "email", with: "test@example.com"
        fill_in "password", with: "testtest"
        click_button "ログインする"
        find('.nav-items').click
        find("a", text: "ログアウト").click
        expect(page).to have_content "ログアウトしました。"
      end
    end

    context "入力値が不正の場合" do
      it "ログインできない" do
        visit new_user_session_path
        fill_in "email", with: "testtest@example.com"
        fill_in "password", with: "testtest"
        click_button "ログインする"
        expect(page).to have_content "Eメールまたはパスワードが違います。"
      end
    end
  end
end
