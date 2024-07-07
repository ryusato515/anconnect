require 'rails_helper'

RSpec.describe User, type: :model do
  it 'パスワードが5文字以上であり、英字と数字が含まれていれば有効であること' do
    user = build(:user, password: 'abc12', password_confirmation: 'abc12')
    expect(user).to be_valid
  end

  it 'パスワードが5文字未満の場合、無効であること' do
    user = build(:user, password: 'abc1', password_confirmation: 'abc1')
    user.valid?
    expect(user.errors[:password]).to include('は5文字以上で入力してください')
  end

  it 'パスワードが英字のみの場合、無効であること' do
    user = build(:user, password: 'abcdef', password_confirmation: 'abcdef')
    user.valid?
    expect(user.errors[:password]).to include('は不正な値です')
  end

  it 'パスワードが数字のみの場合、無効であること' do
    user = build(:user, password: '123456', password_confirmation: '123456')
    user.valid?
    expect(user.errors[:password]).to include('は不正な値です')
  end

  it 'パスワードとパスワード確認が一致しない場合、無効であること' do
    user = build(:user, password: 'abc123', password_confirmation: 'xyz789')
    user.valid?
    expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
  end

  it 'パスワード確認が空の場合、無効であること' do
    user = build(:user, password: 'abc123', password_confirmation: '')
    user.valid?
    expect(user.errors[:password_confirmation]).to include('を入力してください')
  end

  it 'メールアドレスが重複している場合、無効であること' do
    create(:user, email: 'test@example.com')
    user = build(:user, email: 'test@example.com')
    user.valid?
    expect(user.errors[:email]).to include('はすでに存在します')
  end

  it 'メールアドレスが空の場合、無効であること' do
    user = build(:user, email: '')
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it '名前が空の場合、無効であること' do
    user = build(:user, name: '')
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end

  it '名前が255文字を超える場合、無効であること' do
    user = build(:user, name: 'a' * 256)
    user.valid?
    expect(user.errors[:name]).to include('は255文字以内で入力してください')
  end
end