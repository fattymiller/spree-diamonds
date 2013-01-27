Spree::Variant.class_eval do
  attr_accessible :is_in_usd, :unconverted_price, :certificate_number
  
  has_one :diamond_certification

  has_many :variant_properties, :dependent => :destroy
  has_many :properties, :through => :variant_properties
  
  def price
    !!self[:is_in_usd] ? convert_price(self[:price]) : self[:price]
  end  
  
  def unconverted_price=(unconverted)
    self.price = unconverted
  end
  def unconverted_price
    self[:price]
  end
  
  def set_property(property_name, property_value)
    ActiveRecord::Base.transaction do
      property = Spree::Property.where(:name => property_name).first_or_initialize
      property.presentation = property_name
      property.save!

      variant_property = Spree::VariantProperty.where(:variant_id => id, :property_id => property.id).first_or_initialize
      variant_property.property = property
      variant_property.value = property_value
      variant_property.save!
    end
  end
  
  def product_description
    nil if !product.is_diamond?

    format = [  "#{I18n.t("diamond.cut.meta.#{option_value("stone-cut").downcase.gsub(" ", "_").gsub("/", "").gsub("\\", "")}").humanize}, this",
                "#{I18n.t("diamond.clarity.meta.#{option_value("stone-clarity").upcase}")}",
                "#{option_value("stone-carat").downcase} carat",
                "#{option_value("stone-shape").downcase} cut diamond",
                "#{I18n.t("diamond.colour.meta.#{option_value("stone-colour").upcase}")}." ]
              
    format.join(" ")
  end
  
  private
  
  def convert_price(price)
    return price * Spree::Config.conversion_rate
  end
  
end