class CreateDiamondCertifications < ActiveRecord::Migration
  def change
    create_table :diamond_certifications do |t|
      t.integer :variant_id
      t.text :ocr
      
      t.has_attached_file :certificate

      t.timestamps
    end
  end
end
