Spree::Variant.class_eval do
  attr_accessible :is_in_usd, :unconverted_price
  
  def price
    !!self[:is_in_usd] ? convert_price(self[:price]) : self[:price]
  end  
  
  def unconverted_price=(unconverted)
    self.price = unconverted
  end
  def unconverted_price
    self[:price]
  end
  
  
  private
  
  def convert_price(price)
    return price * Spree::Config.conversion_rate
  end
  
end