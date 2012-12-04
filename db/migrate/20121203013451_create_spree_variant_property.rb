class CreateSpreeVariantProperty < ActiveRecord::Migration
  def change
    create_table :spree_variant_properties do |t|
      t.integer :variant_id
      t.integer :property_id
      t.text :value
      
      t.timestamps
    end
  end
end
