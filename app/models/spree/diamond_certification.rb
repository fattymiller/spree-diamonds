module Spree
  class DiamondCertification < ActiveRecord::Base
    attr_accessible :ocr, :variant_id
  
    belongs_to :variant  
    has_many :images, :as => :viewable, :order => :position, :dependent => :destroy
  end
end