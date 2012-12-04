class RenameDiamondCertificationTableToSpreeDiamondCertification < ActiveRecord::Migration
  def up
    rename_table :diamond_certifications, :spree_diamond_certifications
  end

  def down
    rename_table :spree_diamond_certifications, :diamond_certifications
  end
end
