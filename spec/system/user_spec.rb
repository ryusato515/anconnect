require 'rails_helper'

RSpec.describe 'ユーザー認証のシステムテスト', type: :system do
  before do
    driven_by(:rack_test)
  end

  it '新規登録ができること' do
    visit '/users/new'
    fill_in '名前', with: 'テスト太郎'
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'p@ssw0rd'
    fill_in 'パスワード（確認用）', with: 'p@ssw0rd'
    click_button '会員登録する'
  end

  it 'バリデーションエラーで新規登録が失敗すること' do
    visit '/users/new'
    fill_in '名前', with: ''
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'p@ss'
    fill_in 'パスワード（確認用）', with: 'p@ss'
    click_button '会員登録する'
  end
end