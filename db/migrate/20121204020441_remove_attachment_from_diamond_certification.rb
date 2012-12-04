class RemoveAttachmentFromDiamondCertification < ActiveRecord::Migration
  def up
    remove_column :diamond_certifications, :certificate_file_name
    remove_column :diamond_certifications, :certificate_content_type
    remove_column :diamond_certifications, :certificate_file_size
    remove_column :diamond_certifications, :certificate_updated_at
  end

  def down
    add_column :diamond_certifications, :certificate_file_name, :string
    add_column :diamond_certifications, :certificate_content_type, :string
    add_column :diamond_certifications, :certificate_file_size, :integer
    add_column :diamond_certifications, :certificate_updated_at, :datetime
  end
end
