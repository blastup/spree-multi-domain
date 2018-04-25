require 'spec_helper'

describe Spree::Tracker do
  before(:each) do
    store = FactoryBot.create(:store)
    @tracker = FactoryBot.create(:tracker, store: store, analytics_id: 'test-analytic-id-1')

    another_store = FactoryBot.create(:store, url: 'completely-different-store.com')
    @tracker2 = FactoryBot.create(:tracker, store: another_store, analytics_id: 'test-analytic-id-2')
  end

  it "should pull out the current tracker" do
    Spree::Tracker.current('www.example.com').should == @tracker
  end
end
