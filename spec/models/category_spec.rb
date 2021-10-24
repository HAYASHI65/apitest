require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryBot.build(:category)
  end
  describe 'カテゴリー名の登録' do
    context 'カテゴリー名の登録ができる時' do
      it 'カテゴリー名が存在すれば登録できる' do
        expect(@category).to be_valid
      end
    end
    context 'カテゴリー名の登録ができない時' do
      it 'カテゴリー名が空の場合登録できない' do
        @category.name = ''
        @category.valid?
        expect(@category.errors.full_messages).to include("Name can't be blank")
      end
      it 'カテゴリー名が重複している場合登録できない' do
        @category.save
        another_category = FactoryBot.build(:category)
        another_category.name = @category.name
        another_category.valid?
        expect(another_category.errors.full_messages).to include('Name has already been taken')
      end
    end
  end
end
