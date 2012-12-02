class AddCertificationNumberToDiamondCertification < ActiveRecord::Migration
  def change
    add_column :diamond_certifications, :certificate_number, :string
  end
end
