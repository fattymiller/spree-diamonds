class DiamondCertification < ActiveRecord::Base
  attr_accessible :ocr, :variant_id
  
  belongs_to :variant
  
  has_attached_file :certificate
end
