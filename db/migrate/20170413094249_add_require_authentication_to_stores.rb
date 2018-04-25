class AddRequireAuthenticationToStores < ActiveRecord::Migration
  def self.up
    change_table :spree_stores do |t|
      t.boolean :requires_authentication, :default => false
    end
  end

  def self.down
    change_table :spree_stores do |t|
      t.remove :requires_authentication
    end
  end

end
