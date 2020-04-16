require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "#index" do
    context "認証済みのユーザー"
    let(:user) { create(:user) }

    it "正常にレスポンスを返すこと" do
      sign_in user
      get :index
      expect(response).to be_successful
    end

    it "200を返すこと" do
      sign_in user
      get :index
      expect(response).to have_http_status "200"
    end
  end

    context "認証済みでないユーザー" do
      it "正常にレスポンスを返さないこと" do
        get :index
        expect(response).to_not be_successful
      end
      it "302を返すこと" do
        get :index
        expect(response).to have_http_status "302"
      end

      it "サインインページに戻ること" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
