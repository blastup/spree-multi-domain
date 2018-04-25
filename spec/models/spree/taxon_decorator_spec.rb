require 'spec_helper'

describe Spree::Taxon do    
  describe ".find_by_store_id_and_permalink!" do        
    context "taxon exist in given store" do

      let!(:store) { FactoryBot.create :store }
      let!(:taxonomy) { FactoryBot.create :taxonomy , store: store}
      let!(:taxon) { FactoryBot.create :taxon , taxonomy: taxonomy}      

      let!(:anotherstore) { FactoryBot.create :store, name: "second-test-store" }
      let!(:anothertaxonomy) { FactoryBot.create :taxonomy , store: anotherstore}
      let!(:anothertaxon) { FactoryBot.create :taxon , taxonomy: anothertaxonomy}      

      it "should return a taxon" do
        found_taxon = Spree::Taxon.find_by_store_id_and_permalink!(store.id, taxon.permalink)
        found_taxon.should == taxon
        found_taxon.should_not == anothertaxon
      end        
    end

    context "taxon does not exist in given store" do
      it "should raise active_record::not_found" do
        expect{
          Spree::Taxon.find_by_store_id_and_permalink!(1, "non-existing-permalink")
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'scopes' do
    describe '.by_store' do
      before(:each) do
        @store = FactoryBot.create(:store)
        @taxonomy = FactoryBot.create(:taxonomy, store: @store)
        @taxon = FactoryBot.create(:taxon, taxonomy: @taxonomy)
        @taxon2 = FactoryBot.create(:taxon)
      end

      it 'correctly finds taxon by store' do
        taxon_by_store = Spree::Taxon.by_store(@store)

        taxon_by_store.should include(@taxon)
        taxon_by_store.should_not include(@taxon2)
      end
    end
  end
end