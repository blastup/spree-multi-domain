require 'spec_helper'

describe Spree::ProductsController do

  let!(:product) { FactoryBot.create(:product) }

  describe 'on :show to a product without any stores' do
    let!(:store) { FactoryBot.create(:store) }

    it 'should return 404' do
      spree_get :show, id: product.to_param

      expect(response.status).to eq 404
    end
  end

  # Regression test for #75
  describe 'on :show to a product in the wrong store' do
    let!(:store_1) { FactoryBot.create(:store) }
    let!(:store_2) { FactoryBot.create(:store) }

    before(:each) do
      product.stores << store_1
    end

    it 'should return 404' do
      controller.stub(current_store: store_2)
      spree_get :show, id: product.to_param

      expect(response.status).to eq 404
    end
  end

  describe 'on :show to a product w/ store' do
    let!(:store) { FactoryBot.create(:store) }

    before(:each) do
      product.stores << store
    end

    it 'should return 200' do
      controller.stub(current_store: store)
      spree_get :show, id: product.to_param

      expect(response.status).to eq 200
    end
  end

end
