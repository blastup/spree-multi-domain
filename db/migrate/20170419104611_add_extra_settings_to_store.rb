# This migration comes from spree_multi_domain (originally 20170419104611)
class AddExtraSettingsToStore < ActiveRecord::Migration
  def self.up
    change_table :spree_stores do |t|
      t.text :extra_settings
    end
  end

  def self.down
    change_table :spree_stores do |t|
      t.remove :extra_settings
    end
  end
end
