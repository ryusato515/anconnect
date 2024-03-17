require 'rails_helper'

RSpec.describe User, type: :model do
  it 'パスワードが5文字以上であり、英字と数字が含まれていれば有効であること' do
    user = build(:user, password: 'abc12', password_confirmation: 'abc12')
    expect(user).to be_valid
  end

  it 'パスワードが5文字未満の場合、無効であること' do
    user = build(:user, password: 'abc1', password_confirmation: 'abc1')
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 5 characters)')
  end

  it 'パスワードが英字のみの場合、無効であること' do
    user = build(:user, password: 'abcdef', password_confirmation: 'abcdef')
    user.valid?
    expect(user.errors[:password]).to include('is invalid')
  end

  it 'パスワードが数字のみの場合、無効であること' do
    user = build(:user, password: '123456', password_confirmation: '123456')
    user.valid?
    expect(user.errors[:password]).to include('is invalid')
  end

  it 'パスワードとパスワード確認が一致しない場合、無効であること' do
    user = build(:user, password: 'abc123', password_confirmation: 'xyz789')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it 'パスワード確認が空の場合、無効であること' do
    user = build(:user, password: 'abc123', password_confirmation: '')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end
end