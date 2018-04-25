require 'spec_helper'

describe Spree::Order do

  before(:each) do
    @store = FactoryBot.create(:store)
    @order = FactoryBot.create(:order, store: @store)

    @order2 = FactoryBot.create(:order)
  end

  it 'should correctly find order by store' do
    order_by_store = Spree::Order.by_store(@store)

    order_by_store.should include(@order)
    order_by_store.should_not include(@order2)
  end
end
