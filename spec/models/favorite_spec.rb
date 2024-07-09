require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    context 'ユーザーと投稿が存在する場合' do
      it '有効であること' do
        favorite = build(:favorite)
        expect(favorite).to be_valid
      end
    end

    context 'ユーザーが存在しない場合' do
      it '無効であること' do
        favorite = build(:favorite, user: nil)
        favorite.valid?
        expect(favorite.errors[:user]).to include("を入力してください")
      end
    end

    context '投稿が存在しない場合' do
      it '無効であること' do
        favorite = build(:favorite, post: nil)
        favorite.valid?
        expect(favorite.errors[:post]).to include("を入力してください")
      end
    end
  end

  describe 'association' do
    it 'ユーザーに属していること' do
      expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it '投稿に属していること' do
      expect(Favorite.reflect_on_association(:post).macro).to eq :belongs_to
    end
  end
end