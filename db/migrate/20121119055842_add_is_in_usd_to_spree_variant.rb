class AddIsInUsdToSpreeVariant < ActiveRecord::Migration
  def change
    add_column :spree_variants, :is_in_usd, :boolean
  end
end
