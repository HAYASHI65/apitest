require 'rails_helper'

describe IdeasController, type: :request do
  before do
    @category = FactoryBot.create(:category)
    @idea = FactoryBot.create(:idea)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get ideas_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに本文が存在する' do
      get ideas_path
      expect(response.body).to include(@idea.body)
    end
  end
end
