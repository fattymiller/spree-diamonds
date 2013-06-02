Spree::Variant.class_eval do
  attr_accessible :is_in_usd, :unconverted_price, :certificate_number, :sale_price, :sale_starts, :sale_ends, :diamond_certificate
  
  has_one :diamond_certification

  has_many :variant_properties, :dependent => :destroy
  has_many :properties, :through => :variant_properties
  
  def diamond_certificate=(file)
    build_diamond_certification.save! if !diamond_certification
    diamond_certification.images.create!({ :attachment => file }, :without_protection => true)
  end
  
  def price
    currently_on_sale? ? sale_price : normal_price
  end
  def normal_price
    convert_price unconverted_price
  end  
  def sale_price
    convert_price(self[:sale_price] || product.sale_price)
  end
  
  def inside_sale_bounds?
    (!sale_starts || Time.now > sale_starts) && (!sale_ends || Time.now < sale_ends)
  end
  
  def currently_on_sale?
    (product && product.currently_on_sale?) || (self[:sale_price] && inside_sale_bounds?)
  end
  
  def is_in_usd
    in_usd?
  end
  def is_explicitly_usd?
    !!self[:is_in_usd]
  end
  def in_usd?
    return true if is_explicitly_usd?
    
    return false if is_master || !product || !product.persisted? || product.new_record?
    return false if product.variants_including_master.size == 0
    
    return product.master.is_explicitly_usd?
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
    price && in_usd? ? (price * Spree::Config.conversion_rate) : price
  end
  
end