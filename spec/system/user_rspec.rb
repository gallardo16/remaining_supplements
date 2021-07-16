require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
  context '入力値が正しい場合' do
    it 'メールとパスワードがある場合、アカウント登録できる' do
      visit new_user_registration_path
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'testtest'
      fill_in 'password_confirmation', with: 'testtest'
      click_button "アカウント登録"
      expect(page).to have_content 'アカウント登録が完了しました。'
    end
  end
  context '入力値が不正の場合' do
    it "メールがない場合、無効である" do
      visit new_user_registration_path
      fill_in 'email', with: ''
      fill_in 'password', with: 'testtest'
      fill_in 'password_confirmation', with: 'testtest'
      click_button "アカウント登録"
      expect(page).to have_content 'Eメールを入力してください'
    end

    it "パスワードがない場合、無効である" do
      visit new_user_registration_path
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: ''
      fill_in 'password_confirmation', with: ''
      click_button "アカウント登録"
      expect(page).to have_content 'パスワードを入力してください'
    end

    it "パスワードが6文字以内の場合、無効である" do
      visit new_user_registration_path
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'test'
      fill_in 'password_confirmation', with: 'test'
      click_button "アカウント登録"
      expect(page).to have_content 'パスワードは6文字以上で入力してください'
    end

    it "パスワードが一致しない場合、無効である" do
      visit new_user_registration_path
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'testtest'
      fill_in 'password_confirmation', with: 'testtesttest'
      click_button "アカウント登録"
      expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
    end

    it "重複したメールアドレスの場合、無効である" do
      user = FactoryBot.create(:user)
      visit new_user_registration_path
      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'testteset'
      fill_in 'password_confirmation', with: 'testtest'
      click_button "アカウント登録"
      expect(page).to have_content 'Eメールはすでに存在します'
    end
  end
end
