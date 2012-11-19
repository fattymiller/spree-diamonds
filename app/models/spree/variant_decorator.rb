Spree::Variant.class_eval do
  attr_accessible :is_in_usd
  
  def price
    !!self[:is_in_usd] ? convert_price(self[:price]) : self[:price]
  end
  
  def convert_price(price)
    return price * Spree::Config.conversion_rate
  end
end