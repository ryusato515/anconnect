require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'コメントがない場合は無効であること' do
      post = build(:post, comment: nil)
      post.valid?
      expect(post.errors[:comment]).to include('を入力してください')
    end

    it 'コメントが140文字を超える場合は無効であること' do
      post = build(:post, comment: 'a' * 141)
      post.valid?
      expect(post.errors[:comment]).to include('は140文字以内で入力してください')
    end

    it 'お菓子名がない場合は無効であること' do
      post = build(:post, name: nil)
      post.valid?
      expect(post.errors[:name]).to include('を入力してください')
    end

    it '写真がない場合は無効であること' do
      post = build(:post, photo_image: nil)
      post.valid?
      expect(post.errors[:photo_image]).to include('を入力してください')
    end

    it '店名がない場合は無効であること' do
      post = build(:post, shop_name: nil)
      post.valid?
      expect(post.errors[:shop_name]).to include('を入力してください')
    end
  end
end