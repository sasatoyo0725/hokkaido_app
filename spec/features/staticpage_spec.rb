require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  context "homeへアクセスする時" do
    it 'リクエストが成功する' do
      get '/'
      expect(rsponse).to eq('http://localhost:3000/')
    end
    it '| 北海道穴場観光マップのタイトルがあればOK' do
      expect(response.body).to include '| 北海道穴場観光マップ'
      expect(response.body).to_not include '北海道穴場観光マップ'
    end
  end
end
