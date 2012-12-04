module Spree
  class VariantProperty < ActiveRecord::Base
    belongs_to :property
    belongs_to :variant
  
    validates :property, :presence => true
    validates :value, :length => { :maximum => 255 }

    attr_accessible :property_name, :value

    # virtual attributes for use with AJAX completion stuff
    def property_name
      property.name if property
    end

    def property_name=(name)
      unless name.blank?
        unless property = Property.find_by_name(name)
          property = Property.create(:name => name, :presentation => name)
        end
        self.property = property
      end
    end
  end
end