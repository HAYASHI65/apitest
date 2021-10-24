require 'rails_helper'

RSpec.describe Idea, type: :model do
  before do
    @category = FactoryBot.create(:category)
    @idea = FactoryBot.build(:idea)
    @idea.category_id = @category.id
  end
  describe 'アイデアの登録' do
    context 'アイデアの登録ができる時' do
      it 'アイデアの本文が存在すれば登録できる' do
        expect(@idea).to be_valid
      end
    end
    context 'アイデアの登録ができない時' do
      it 'アイデアが空の場合登録できない' do
        @idea.body = ''
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Body can't be blank")
      end
    end
  end
end
