module Spree
  class StoreTaxonomy < ActiveRecord::Base
    belongs_to :store
    belongs_to :taxonomy
  end
end
