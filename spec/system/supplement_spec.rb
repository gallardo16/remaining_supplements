require "rails_helper"

RSpec.describe "サプリメント管理機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @supplement = FactoryBot.create(:supplement)
    visit new_user_session_path
    fill_in "email", with: "test@example.com"
    fill_in "password", with: "testtest"
    click_button "ログイン"
  end
  describe "サプリメント一覧" do
    context "入力値が正しい場合" do
      it "一覧に表示されている" do
        expect(page).to have_content "foo"
      end

      it "アコーディオンメニューを開ける" do
        find(".js-accordion").click
        expect(page).to have_content "なくなる日"
        expect(page).to have_content "リマインド"
        expect(page).to have_content "1日の摂取量"
      end

      it "サプリメントがない場合は文言が表示される" do
        find(".js-accordion").click
        click_on "内容変更"
        find('.fa-trash').click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "サプリメントは登録されていません！"
      end
    end
  end

  describe "サプリメント登録" do
    before do
      visit new_supplement_path
    end
    context "入力値が正しい場合" do
      it "サプリメントを登録できる" do
        fill_in "name", with: "barbar"
        fill_in "content_size", with: 1000
        fill_in "daily_intake", with: 50
        select "1日前"
        click_button "登録する"
        expect(page).to have_content "サプリメント「barbar」を登録しました。"
      end
    end

    context "入力値が不正の場合" do
      it "名前がない場合は、無効である" do
        fill_in "name", with: ""
        fill_in "content_size", with: 1000
        fill_in "daily_intake", with: 50
        select "1日前"
        click_button "登録する"
        expect(page).to have_content "サプリ名を入力してください"
      end

      it "内容量がない場合は、無効である" do
        fill_in "name", with: "barbar"
        fill_in "content_size", with: nil
        fill_in "daily_intake", with: 50
        select "1日前"
        click_button "登録する"
        expect(page).to have_content "内容量を入力してください"
      end

      it "1日の摂取量がない場合は、無効である" do
        fill_in "name", with: "barbar"
        fill_in "content_size", with: 1000
        fill_in "daily_intake", with: nil
        select "1日前"
        click_button "登録する"
        expect(page).to have_content "1日あたりの摂取量を入力してください"
      end

      it "内容量 >= 1日の摂取量でない場合は、無効である" do
        fill_in "name", with: "barbar"
        fill_in "content_size", with: 10
        fill_in "daily_intake", with: 50
        select "1日前"
        click_button "登録する"
        expect(page).to have_content "内容量は「1日の摂取量」以上にしてください"
      end

      it "内容量が0の場合は、無効である" do
        fill_in "name", with: "barbar"
        fill_in "content_size", with: 0
        fill_in "daily_intake", with: 50
        select "1日前"
        click_button "登録する"
        expect(page).to have_content "内容量は0より大きい値にしてください"
      end

      it "1日の摂取量が0の場合は、無効である" do
        fill_in "name", with: "barbar"
        fill_in "content_size", with: 1000
        fill_in "daily_intake", with: 0
        select "1日前"
        click_button "登録する"
        expect(page).to have_content "1日あたりの摂取量は0より大きい値にしてください"
      end
    end
  end

  describe "サプリメント更新" do
    before do
      visit supplements_path
      find(".js-accordion").click
      click_on "内容変更"
    end
    context "入力値が正しい場合" do
      it "サプリメントを更新できる" do
        fill_in "name", with: "bazbaz"
        fill_in "content_size", with: 100000
        fill_in "daily_intake", with: 5000
        select "5日前"
        click_button "更新する"
        expect(page).to have_content "サプリメント「bazbaz」を更新しました。"
      end
    end

    context "入力値が不正の場合" do
      it "名前がない場合は、無効である" do
        fill_in "name", with: ""
        click_button "更新する"
        expect(page).to have_content "サプリ名を入力してください"
      end

      it "内容量がない場合は、無効である" do
        fill_in "content_size", with: nil
        click_button "更新する"
        expect(page).to have_content "内容量を入力してください"
      end

      it "1日の摂取量がない場合は、無効である" do
        fill_in "daily_intake", with: nil
        click_button "更新する"
        expect(page).to have_content "1日あたりの摂取量を入力してください"
      end

      it "内容量 >= 1日の摂取量でない場合は、無効である" do
        fill_in "content_size", with: 1000
        fill_in "daily_intake", with: 5000
        click_button "更新する"
        expect(page).to have_content "内容量は「1日の摂取量」以上にしてください"
      end

      it "内容量が0の場合は、無効である" do
        fill_in "content_size", with: 0
        click_button "更新する"
        expect(page).to have_content "内容量は0より大きい値にしてください"
      end

      it "1日の摂取量が0の場合は、無効である" do
        fill_in "daily_intake", with: 0
        click_button "更新する"
        expect(page).to have_content "1日あたりの摂取量は0より大きい値にしてください"
      end
    end
  end
end
