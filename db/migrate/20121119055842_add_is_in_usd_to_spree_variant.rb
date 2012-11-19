class AddIsInUsdToSpreeVariant < ActiveRecord::Migration
  def change
    add_column :spree_variants, :is_in_usd, :boolean
    change_column :spree_variants, :is_in_usd, :boolean, :default => false, :null => false
  end
end
